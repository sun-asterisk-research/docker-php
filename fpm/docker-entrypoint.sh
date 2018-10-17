#!/bin/sh

set -e

write_configs() {
    for f in $(find $1 -regex ".*$2\$"); do
        envsubst < $f > "$3/$(basename $f)"
    done
}

write_configs /tmp/php-conf .ini /usr/local/etc/php/conf.d
write_configs /tmp/php-fpm .conf /usr/local/etc/php-fpm.d

exec docker-php-entrypoint "$@"
