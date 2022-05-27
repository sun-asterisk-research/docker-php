#!/bin/sh

vars=$(env | cut -d= -f1 | awk '{print "${" $1 "}"}')

mkdir -p /etc/nginx/conf.d

for conf in /etc/nginx/templates.d/*.conf; do
    envsubst "$vars" < "$conf" | tee "/etc/nginx/conf.d/$(basename $conf)"
done
