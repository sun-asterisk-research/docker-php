#!/bin/bash

set -e

source generate_utils.sh

meta_from_full_tag() {
    local php_version variant distro_release
    IFS='-' read php_version variant distro_release <<< $1

    if contains "$distro_release" "$debian_releases"; then
        local distro=debian
    elif contains "$distro_release" "$alpine_releases"; then
        local distro=alpine
    fi

    cat << EOF
local php_version="$(get_version $php_version)"
local php_major="$(get_major $php_version)"
local php_minor="$(get_minor $php_version)"

local variant="$variant"

local distro_release="$distro_release"
local distro="$distro"
EOF
}

eval $(get_versions)

default_php_major="$(get_major $default_php_version)"
default_php_minor="$(get_minor $default_php_version)"
eval default_distro_release=\$"default_${default_distro}_release"

generate_dockerfile() {
    eval $(meta_from_full_tag $1)

    if [ "$variant" = nginx ]; then
        local php_variant=fpm
    else
        local php_variant=$variant
    fi

    echo "generating $php_minor/$distro_release/$variant ..."

    local dir="$php_minor/$distro_release/$variant"
    local dockerfile="$dir/Dockerfile"

    mkdir -p "$dir"

    write_warn_edit $dockerfile

    for tpl in $(ls Dockerfile*.template | grep -E "Dockerfile-[0-9]+(|-${variant})(-${distro})?.template"); do
        # Base Dockerfile
        tpl "$tpl" \
            version=php_version \
            variant=php_variant \
            distro_release \
            >> $dockerfile
    done

    if [ "$php_minor" \< 7.4 ]; then
        sed -Ei -e 's/--with-jpeg/--with-jpeg-dir=\/usr\/include/' $dockerfile
    fi

    # RootFS
    if [ -d "$variant" ]; then
        cp -rT $variant "$dir/rootfs"
    fi

    # Entrypoint
    local entrypoint="$dir/rootfs/usr/local/bin/docker-php-entrypoint"

    mkdir -p "$dir/rootfs/usr/local/bin"
    > $entrypoint
    chmod +x $entrypoint

    if [ "$distro" = debian ]; then
        local shebang="#!/bin/bash"
    else
        local shebang="#!/bin/sh"
    fi

    for tpl in $(ls docker-php-entrypoint*.template | grep -E "docker-php-entrypoint-[0-9]+(|-${php_variant})(-${distro})?.template"); do
        # Base Dockerfile
        tpl "$tpl" shebang >> $entrypoint
    done
}

generate_tags() {
    local IFS=','

    local tags

    for version in $1; do
        for variant in $2; do
            for distro in $3; do
                local tag=$(echo "$version-$variant-$distro" | sed -E -e 's/default(-|$)//g' | trim -)
                if [ -z "$tag" ]; then
                    tag=latest
                fi
                tags="$tags $tag"
            done
        done
    done

    echo "$tags"
}

format_bake_target() {
    sed 's/\./_/g'
}

generate_bake_file_target() {
    eval $(meta_from_full_tag $1)

    [ "$php_minor" = "$default_php_minor" ] && local is_default_version=true
    [ "$variant" = "$default_variant" ] && local is_default_variant=true
    [ "$distro_release" = "$default_distro_release" ] && local is_default_distro_release=true

    local version_tags="$php_minor,$php_version"

    if eval [ "$php_minor" = \$"default_php_${php_major}_version" ]; then
        version_tags="$php_major,$version_tags"
    fi

    if [ "$php_minor" = "$default_php_minor" ]; then
        version_tags="$version_tags,default"
    fi

    local variant_tags="$variant"

    if [ "$variant" = "$default_variant" ]; then
        variant_tags="$variant_tags,default"
    fi

    local distro_tags="$distro_release"

    if [ "$distro" = "alpine" ] && [ "$distro_release" = "$default_alpine_release" ]; then
        distro_tags="$distro_tags,alpine"
    fi

    if [ "$distro_release" = "$default_distro_release" ]; then
        distro_tags="$distro_tags,default"
    fi

    tags=$(
        generate_tags "$version_tags" "$variant_tags" "$distro_tags" \
        | sed -E 's/(^|[[:space:]])/\1\\${REGISTRY}\/\\${REPO}:/g' \
        | format_list \
        | indent 1 4 \
        | trim
    )

    bake_target=$(echo "$php_version-$variant-$distro_release" | format_bake_target)
    bake_target_minor_version=$(echo "$php_minor-$variant-$distro_release" | format_bake_target)

    tpl docker-bake-target.template \
        bake_target \
        bake_target_minor_version \
        php_version \
        php_minor \
        variant \
        distro_release \
        tags
}

generate_bake_file() {
    local bake_file="docker-bake.hcl"

    echo "generating $bake_file ..."

    write_warn_edit $bake_file

    local targets=$(echo "$@" | format_bake_target | format_list | indent 1 4 | trim)

    tpl docker-bake.template targets >> $bake_file

    for target in $@; do
        generate_bake_file_target $target >> $bake_file
    done
}

generate_workflow() {
    local workflow_file=".github/workflows/ci.yml"

    echo "generating $workflow_file ..."

    mkdir -p .github/workflows
    write_warn_edit $workflow_file

    local targets=$(echo "$@" | format_bake_target | format_list 2 | indent 5 2 | trim)
    local platforms=$(echo $platforms | sed 's/ /,/g')

    tpl ci.yml.template targets platforms >> $workflow_file
}

generate_all() {
    local distro_releases="$debian_releases $alpine_releases"

    local targets=""

    for version in $(echo "$php_versions" | sed -e 's/ /\n/g' | sort -r); do
        for distro in $distro_releases; do
            for variant in cli fpm nginx; do
                targets="$targets $version-$variant-$distro"
            done
        done
    done

    for target in $targets; do
        generate_dockerfile $target
    done

    generate_bake_file $targets
    generate_workflow $targets
}

clean_all() {
    for version in $php_versions; do
        rm -rf $(get_minor $version)
    done

    rm -f docker-bake.hcl
    rm -f .github/workflows/ci.yml
}

if [ "$#" = 0 ]; then
    generate_all
elif [ "$1" = "clean" ]; then
    clean_all
fi
