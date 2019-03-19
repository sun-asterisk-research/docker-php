#!/bin/bash

set -e

latest=alpine
main_variant=cli
main_suite=alpine

php_version=$1
variant=$2
suite=$3

if [ "$variant" = caddy ]; then
    php_variant=fpm
else
    php_variant=$variant
fi

if [ "$3" = "$DEBIAN_SUITE" ]; then
    distro=debian
else
    distro=alpine
fi

dir="$suite/$variant"
dockerfile="$dir/Dockerfile"

mkdir -p "$dir"

echo $'# Generated via generate.sh. Please don\'t edit directly\n' > $dockerfile

# Caddy base image
if [ "$variant" = caddy ]; then
    echo $'FROM abiosoft/caddy:no-stats as caddy\n' >> $dockerfile
fi

# Base Dockerfile
sed -r \
    -e "s!%%version%%!$php_version!" \
    -e "s!%%variant%%!$php_variant!" \
    -e "s!%%debian_suite%%!$DEBIAN_SUITE!" \
    "Dockerfile-$distro.template" >> $dockerfile

# fcgi for php-fpm healthcheck
if [ "$variant" = fpm ]; then
    cat "fcgi-$distro-Dockerfile.template" >> $dockerfile
fi

# Variant-specific commands
cat "$variant-Dockerfile.template" >> $dockerfile

# PHP configs
cp -rT "config/$php_variant" "$dir/config"
cp "php-$variant-entrypoint" "$dir"

# php-fpm pool config
if [ "$php_variant" = fpm ]; then
    cp -rT php-fpm "$dir/php-fpm"
    cp php-fpm-healthcheck "$dir"
fi

# Caddyfile for caddy
if [ "$variant" = caddy ]; then
    cp Caddyfile "$dir"
fi

# Docker Hub push hook
mkdir -p "$dir/hooks"

variant_tag="$variant-$suite"

tags="$variant_tag $php_version-$variant_tag"
test "$suite" == "$main_suite" && tags="$php_version-$variant $tags"
test "$suite" == "$main_suite" && test "$variant" == "$main_variant" && tags="$php_version $tags"
test "$suite" == "$latest" && tags="$variant $tags"
test "$variant" == "$main_variant" && tags="$suite $tags"
test "$suite" == "$latest" && test "$variant" = "$main_variant" && tags="latest $tags"

sed "s!%%tags%%!$tags!" push.template > "$dir/hooks/push"
