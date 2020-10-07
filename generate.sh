#!/bin/bash

set -e

latest=7.4
main_variant=cli
main_suite=alpine

php_version=$1
variant=$2
suite=$3

if [ "$variant" = nginx ]; then
    php_variant=fpm
else
    php_variant=$variant
fi

if [ "$3" = "$DEBIAN_SUITE" ]; then
    distro=debian
else
    distro=alpine
fi

write_shebang() {
    if [ "$distro" = debian ]; then
        shebang="#!/bin/bash"
    else
        shebang="#!/bin/sh"
    fi

    sed -i "1i$shebang\n" $1
}

dir="$php_version/$suite/$variant"
dockerfile="$dir/Dockerfile"

mkdir -p "$dir"

echo $'# Generated via generate.sh. Please don\'t edit directly\n' > $dockerfile

# Base Dockerfile
if [ "$php_version" \< 7.4 ]; then
    sed -r \
        -e "s!%%version%%!$php_version!" \
        -e "s!%%variant%%!$php_variant!" \
        -e "s!%%debian_suite%%!$DEBIAN_SUITE!" \
        -e "s!--with-jpeg!--with-jpeg-dir=/usr/include!" \
        "Dockerfile-base-$distro.template" >> $dockerfile
else
    sed -r \
        -e "s!%%version%%!$php_version!" \
        -e "s!%%variant%%!$php_variant!" \
        -e "s!%%debian_suite%%!$DEBIAN_SUITE!" \
        "Dockerfile-base-$distro.template" >> $dockerfile
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
entrypoint="$dir/rootfs/usr/local/bin/docker-php-entrypoint"

mkdir -p "$dir/rootfs/usr/local/bin" && cp docker-php-entrypoint.template "$entrypoint"

if [ "$php_variant" = fpm ]; then
    cat docker-php-entrypoint-fpm.template >> "$entrypoint"
fi

cat docker-php-entrypoint-exec.template >> "$entrypoint"
write_shebang "$entrypoint"

# Docker Hub push hook
mkdir -p "$dir/hooks"

[ "$suite" == "$main_suite" ] && is_main_suite=true
[ "$variant" == "$main_variant" ] && is_main_variant=true

tags="$php_version-$variant-$suite"

if [ "$is_main_variant" ]; then
    tags="$php_version-$suite $tags"
fi

if [ "$is_main_suite" ]; then
    tags="$php_version-$variant $tags"
fi

if [ "$is_main_variant" ] && [ "$is_main_suite" ]; then
    tags="$php_version $tags"
fi

if [ "$php_version" == "$latest" ]; then
    tags="$variant-$suite $tags"

    if [ "$is_main_variant" ]; then
        tags="$suite $tags"
    fi

    if [ "$is_main_suite" ]; then
        tags="$variant $tags"
    fi

    if [ "$is_main_variant" ] && [ "$is_main_suite" ]; then
        tags="latest $tags"
    fi
fi

sed "s!%%tags%%!$tags!" push.template > "$dir/hooks/push"
