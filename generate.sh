#!/bin/bash

set -e

php_version=$1
variant=$2

if [ "$variant" = caddy ]; then
    php_variant=fpm
else
    php_variant=$variant
fi

if [ "$3" = "$DEBIAN_SUITE" ]; then
    suite=debian
else
    suite=alpine
fi

dir="$3/$variant"
dockerfile="$dir/Dockerfile"

mkdir -p "$dir"

echo $'# Generated via generate.sh. Please don\'t edit directly\n' > $dockerfile

if [ "$variant" = caddy ]; then
    echo $'FROM abiosoft/caddy:no-stats as caddy\n' >> $dockerfile
fi

sed -r \
    -e "s!%%version%%!$php_version!" \
    -e "s!%%variant%%!$php_variant!" \
    -e "s!%%debian_suite%%!$DEBIAN_SUITE!" \
    "Dockerfile-$suite.template" >> $dockerfile

if [ "$variant" = fpm ]; then
    cat "fcgi-$suite-Dockerfile.template" >> $dockerfile
fi

cat "$variant-Dockerfile.template" >> $dockerfile

cp -rT "config/$php_variant" "$dir/config"
cp "php-$variant-entrypoint" "$dir"

if [ "$php_variant" = fpm ]; then
    cp -rT php-fpm "$dir/php-fpm"
    cp php-fpm-healthcheck "$dir"
fi

if [ "$variant" = caddy ]; then
    cp Caddyfile "$dir"
fi
