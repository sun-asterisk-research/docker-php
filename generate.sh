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
        "Dockerfile-$distro.template" >> $dockerfile
else
    sed -r \
        -e "s!%%version%%!$php_version!" \
        -e "s!%%variant%%!$php_variant!" \
        -e "s!%%debian_suite%%!$DEBIAN_SUITE!" \
        "Dockerfile-$distro.template" >> $dockerfile
fi

# Variant-specific commands
if [ -f "$variant-$distro-Dockerfile.template" ]; then
    cat "$variant-$distro-Dockerfile.template" >> $dockerfile
fi
cat "$variant-Dockerfile.template" >> $dockerfile

# PHP configs
cp -rT "config/$php_variant" "$dir/config"

# Entrypoint
cp "php-$php_variant-entrypoint" "$dir"
write_shebang "$dir/php-$php_variant-entrypoint"

# Variant specific files
if [ -d "$variant" ]; then
    cp -rT $variant "$dir"
fi

# FPM
if [ "$variant" = fpm ]; then
    cp php-fpm-healthcheck "$dir"
    write_shebang "$dir/php-fpm-healthcheck"
fi

# Nginx
if [ "$variant" = nginx ]; then
    cp -R nginx/* "$dir"
fi

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
