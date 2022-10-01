#!/bin/bash

contains() {
    echo "${@:2}" | grep -wq $1
}

get_version() {
    echo "$1" | awk -F '[._]' '{print $1"."$2"."$3}'
}

get_major() {
    echo "$1" | awk -F '[._]' '{print $1}'
}

get_minor() {
    echo "$1" | awk -F '[._]' '{print $1"."$2}'
}

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
    local indent=${1:-4}

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

write_warn_edit() {
    echo -e "# NOTE: This file was generated via generate.sh. Don't edit it directly\n" > $1
}
