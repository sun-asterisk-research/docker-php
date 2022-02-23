#!/bin/bash

set -e

contains() {
    echo "${@:2}" | grep -wq $1
}

get_major() {
    echo "$1" | awk -F '.' '{print $1;}'
}

get_minor() {
    echo "$1" | awk -F '.' '{print $1"."$2;}'
}

indent() {
    level="$1"
    per_level="$2"

    nspaces=$((level * per_level))

    spaces="$(printf %${nspaces}s)"

    sed -E "s/^/$spaces/g"
}

trim() {
    local var="$(cat)"
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    echo "$var"
}

tpl() {
    local vars=""
    local script="{"

    for var_name in ${@:2}; do
        local tpl_var_name=$(echo "$var_name" | awk -F '=' {'print $1'})
        local script_var_name=$(echo "$var_name" | awk -F '=' {'print $2'})

        if [ -z "$script_var_name" ]; then
            script_var_name="$tpl_var_name"
        fi

        script="$script gsub(\"{{ $tpl_var_name }}\",$tpl_var_name);"
        vars="$vars -v $tpl_var_name=\"${!script_var_name}\""
    done

    script="$script }1"

    eval awk "$vars" "'$script'" "$1"
}

format_list() {
    indent=${1:-4}

    echo "["
    trim | sed -E 's/[[:space:]]+/\n/g' | sed -E 's/^(.*)$/\\"\1\\",/' | indent 1 "$indent"
    echo "]"
}

get_versions() {
    cat versions.yml \
        | tr "\n" "\r" \
        | sed 's/\r-//g' \
        | tr '\r' '\n' \
        | sed -E \
            -e's/:[^:\/\/]/="/g' \
            -e 's/(.+)$/\1"/g' \
            -e 's/ *=/=/g'
}

meta_from_full_tag() {
    local php_version variant distro_release
    IFS='-' read php_version variant distro_release <<< $1

    if contains "$distro_release" "$debian_releases"; then
        local distro=debian
    elif contains "$distro_release" "$alpine_releases"; then
        local distro=alpine
    fi

    cat << EOF
local php_version="$php_version"
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

    echo $'# Generated via generate.sh. Please don\'t edit directly\n' > $dockerfile

    # Base Dockerfile
    tpl "Dockerfile-base-$distro.template" \
        version=php_version \
        variant=php_variant \
        distro_release \
        >> $dockerfile

    if [ "$php_minor" \< 7.4 ]; then
        sed -Ei -e 's/--with-jpeg/--with-jpeg-dir=\/usr\/include/' $dockerfile
    fi

    cat "Dockerfile-base.template" >> $dockerfile

    # Variant-specific commands
    if [ -f "Dockerfile-$variant-$distro.template" ]; then
        cat "Dockerfile-$variant-$distro.template" >> $dockerfile
    fi
    cat "Dockerfile-$variant.template" >> $dockerfile

    # Root
    if [ -d "$variant" ]; then
        cp -rT $variant "$dir/rootfs"
    fi

    # Entrypoint
    local entrypoint="$dir/rootfs/usr/local/bin/docker-php-entrypoint"

    mkdir -p "$dir/rootfs/usr/local/bin" && cp docker-php-entrypoint.template "$entrypoint"

    if [ "$php_variant" = fpm ]; then
        cat docker-php-entrypoint-fpm.template >> "$entrypoint"
    fi

    cat docker-php-entrypoint-exec.template >> "$entrypoint"

    # Write entrypoint shebang
    if [ "$distro" = debian ]; then
        local shebang="#!/bin/bash"
    else
        local shebang="#!/bin/sh"
    fi

    sed -i "1i$shebang\n" "$entrypoint"
}

generate_bake_file_target() {
    eval $(meta_from_full_tag $1)

    [ "$php_minor" = "$default_php_minor" ] && local is_default_version=true
    [ "$variant" = "$default_variant" ] && local is_default_variant=true
    [ "$distro_release" = "$default_distro_release" ] && local is_default_distro_release=true

    local version_tags="$php_minor $php_version"

    if eval [ "$php_minor" = \$"default_php_${php_major}_version" ]; then
        version_tags="$php_major $version_tags"
    fi

    local tags=""

    for version in $version_tags; do
        tags="$tags $version-$variant-$distro_release"
    done

    if [ "$is_default_variant" ]; then
        for version in $version_tags; do
            tags="$tags $version-$distro_release"
        done
    fi

    if [ "$is_default_distro_release" ]; then
        for version in $version_tags; do
            tags="$tags $version-$variant"
        done
    fi

    if [ "$is_default_variant" ] && [ "$is_default_distro_release" ]; then
        for version in $version_tags; do
            tags="$tags $version"
        done
    fi

    if [ "$distro" = "alpine" ] && [ "$distro_release" = "$default_alpine_release" ]; then
        for version in $version_tags; do
            tags="$tags $version-alpine"
        done
    fi

    if [ "$is_default_version" ] && [ "$is_default_variant" ] && [ "$is_default_distro_release" ]; then
        tags="$tags latest"
    fi

    tags=$(echo "$tags" | awk -F ' ' '{for(i=1; i<=NF; i++) print "\${REGISTRY}\${REPO}:"$i}' | format_list | indent 1 4 | trim)

    tpl docker-bake-target.template \
        php_version \
        php_minor \
        variant \
        distro_release \
        tags
}

generate_bake_file() {
    local bake_file="docker-bake.hcl"

    echo "generating $bake_file ..."

    local targets=$(echo "$@" | format_list | indent 1 4 | trim)

    tpl docker-bake.template targets > $bake_file

    for target in $@; do
        generate_bake_file_target $target >> $bake_file
    done
}

generate_all() {
    local distro_releases="$debian_releases $alpine_releases"

    local targets=""

    for version in $(echo "$php_versions" | sed -e 's/ /\n/g' | sort); do
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
}

clean_all() {
    for version in $php_versions; do
        rm -rf $(get_minor $version)
    done

    rm -f docker-bake.hcl
}

if [ "$#" = 0 ]; then
    generate_all
elif [ "$1" = "clean" ]; then
    clean_all
fi
