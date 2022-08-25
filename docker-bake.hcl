# NOTE: This file was generated via generate.sh. Don't edit it directly

variable "REGISTRY" {
    default = "docker.io"
}

variable "REPO" {
    default = "sunasteriskrnd/php"
}

group "default" {
    targets = [
        "7_3_33-cli-bullseye",
        "7_3_33-fpm-bullseye",
        "7_3_33-nginx-bullseye",
        "7_3_33-cli-buster",
        "7_3_33-fpm-buster",
        "7_3_33-nginx-buster",
        "7_3_33-cli-alpine3_15",
        "7_3_33-fpm-alpine3_15",
        "7_3_33-nginx-alpine3_15",
        "7_3_33-cli-alpine3_14",
        "7_3_33-fpm-alpine3_14",
        "7_3_33-nginx-alpine3_14",
    ]
}

target "7_3_33-cli-bullseye" {
    context = "./7.3/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-cli-bullseye",
        "${REGISTRY}/${REPO}:7.3-cli",
        "${REGISTRY}/${REPO}:7.3-bullseye",
        "${REGISTRY}/${REPO}:7.3",
        "${REGISTRY}/${REPO}:7.3.33-cli-bullseye",
        "${REGISTRY}/${REPO}:7.3.33-cli",
        "${REGISTRY}/${REPO}:7.3.33-bullseye",
        "${REGISTRY}/${REPO}:7.3.33",
    ]
}

target "7_3-cli-bullseye" {
    inherits = ["7_3_33-cli-bullseye"]
}

target "7_3_33-fpm-bullseye" {
    context = "./7.3/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-fpm-bullseye",
        "${REGISTRY}/${REPO}:7.3-fpm",
        "${REGISTRY}/${REPO}:7.3.33-fpm-bullseye",
        "${REGISTRY}/${REPO}:7.3.33-fpm",
    ]
}

target "7_3-fpm-bullseye" {
    inherits = ["7_3_33-fpm-bullseye"]
}

target "7_3_33-nginx-bullseye" {
    context = "./7.3/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-nginx-bullseye",
        "${REGISTRY}/${REPO}:7.3-nginx",
        "${REGISTRY}/${REPO}:7.3.33-nginx-bullseye",
        "${REGISTRY}/${REPO}:7.3.33-nginx",
    ]
}

target "7_3-nginx-bullseye" {
    inherits = ["7_3_33-nginx-bullseye"]
}

target "7_3_33-cli-buster" {
    context = "./7.3/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-cli-buster",
        "${REGISTRY}/${REPO}:7.3-buster",
        "${REGISTRY}/${REPO}:7.3.33-cli-buster",
        "${REGISTRY}/${REPO}:7.3.33-buster",
    ]
}

target "7_3-cli-buster" {
    inherits = ["7_3_33-cli-buster"]
}

target "7_3_33-fpm-buster" {
    context = "./7.3/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-fpm-buster",
        "${REGISTRY}/${REPO}:7.3.33-fpm-buster",
    ]
}

target "7_3-fpm-buster" {
    inherits = ["7_3_33-fpm-buster"]
}

target "7_3_33-nginx-buster" {
    context = "./7.3/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-nginx-buster",
        "${REGISTRY}/${REPO}:7.3.33-nginx-buster",
    ]
}

target "7_3-nginx-buster" {
    inherits = ["7_3_33-nginx-buster"]
}

target "7_3_33-cli-alpine3_15" {
    context = "./7.3/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-cli-alpine3.15",
        "${REGISTRY}/${REPO}:7.3-cli-alpine",
        "${REGISTRY}/${REPO}:7.3-alpine3.15",
        "${REGISTRY}/${REPO}:7.3-alpine",
        "${REGISTRY}/${REPO}:7.3.33-cli-alpine3.15",
        "${REGISTRY}/${REPO}:7.3.33-cli-alpine",
        "${REGISTRY}/${REPO}:7.3.33-alpine3.15",
        "${REGISTRY}/${REPO}:7.3.33-alpine",
    ]
}

target "7_3-cli-alpine3_15" {
    inherits = ["7_3_33-cli-alpine3_15"]
}

target "7_3_33-fpm-alpine3_15" {
    context = "./7.3/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:7.3-fpm-alpine",
        "${REGISTRY}/${REPO}:7.3.33-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:7.3.33-fpm-alpine",
    ]
}

target "7_3-fpm-alpine3_15" {
    inherits = ["7_3_33-fpm-alpine3_15"]
}

target "7_3_33-nginx-alpine3_15" {
    context = "./7.3/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:7.3-nginx-alpine",
        "${REGISTRY}/${REPO}:7.3.33-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:7.3.33-nginx-alpine",
    ]
}

target "7_3-nginx-alpine3_15" {
    inherits = ["7_3_33-nginx-alpine3_15"]
}

target "7_3_33-cli-alpine3_14" {
    context = "./7.3/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-cli-alpine3.14",
        "${REGISTRY}/${REPO}:7.3-alpine3.14",
        "${REGISTRY}/${REPO}:7.3.33-cli-alpine3.14",
        "${REGISTRY}/${REPO}:7.3.33-alpine3.14",
    ]
}

target "7_3-cli-alpine3_14" {
    inherits = ["7_3_33-cli-alpine3_14"]
}

target "7_3_33-fpm-alpine3_14" {
    context = "./7.3/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-fpm-alpine3.14",
        "${REGISTRY}/${REPO}:7.3.33-fpm-alpine3.14",
    ]
}

target "7_3-fpm-alpine3_14" {
    inherits = ["7_3_33-fpm-alpine3_14"]
}

target "7_3_33-nginx-alpine3_14" {
    context = "./7.3/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.3-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.3-nginx-alpine3.14",
        "${REGISTRY}/${REPO}:7.3.33-nginx-alpine3.14",
    ]
}

target "7_3-nginx-alpine3_14" {
    inherits = ["7_3_33-nginx-alpine3_14"]
}
