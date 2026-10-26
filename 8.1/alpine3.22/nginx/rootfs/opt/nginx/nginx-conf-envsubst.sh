#!/bin/sh

indent() {
    local level="$1"
    local per_level="$2"

    local nspaces=$((level * per_level))
    local spaces="$(printf %${nspaces}s)"

    sed -E "s/^/$spaces/g"
}

trim() {
    local delim=${1:-'[:space:]'}
    local str="$(cat)"
    str="${str#"${str%%[!$delim]*}"}"
    str="${str%"${str##*[!$delim]}"}"
    echo "$str"
}

if [ -n "$NGINX_CONF_SNIPPET" ]; then
    export NGINX_CONF_SNIPPET="
$(echo "$NGINX_CONF_SNIPPET" | trim | indent 1 4)
"
else
    export NGINX_CONF_SNIPPET=""
fi

vars=$(env | cut -d= -f1 | awk '{print "${" $1 "}"}')

mkdir -p /etc/nginx/conf.d

for conf in /etc/nginx/templates.d/*.conf; do
    envsubst "$vars" < "$conf" | tee "/etc/nginx/conf.d/$(basename $conf)"
done
