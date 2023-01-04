# NOTE: This file was generated via generate.sh. Don't edit it directly

variable "REGISTRY" {
    default = "ghcr.io"
}

variable "REPO" {
    default = "sun-asterisk-research/php"
}

target "8_2_1-cli-bullseye" {
    context = "./8.2/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-bullseye",
        "${REGISTRY}/${REPO}:8-bullseye",
        "${REGISTRY}/${REPO}:8-cli",
        "${REGISTRY}/${REPO}:8",
        "${REGISTRY}/${REPO}:8.2-cli-bullseye",
        "${REGISTRY}/${REPO}:8.2-bullseye",
        "${REGISTRY}/${REPO}:8.2-cli",
        "${REGISTRY}/${REPO}:8.2",
        "${REGISTRY}/${REPO}:8.2.1-cli-bullseye",
        "${REGISTRY}/${REPO}:8.2.1-bullseye",
        "${REGISTRY}/${REPO}:8.2.1-cli",
        "${REGISTRY}/${REPO}:8.2.1",
        "${REGISTRY}/${REPO}:cli-bullseye",
        "${REGISTRY}/${REPO}:bullseye",
        "${REGISTRY}/${REPO}:cli",
        "${REGISTRY}/${REPO}:latest",
    ]
}

target "8_2-cli-bullseye" {
    inherits = ["8_2_1-cli-bullseye"]
}

target "8_2_1-fpm-bullseye" {
    context = "./8.2/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-bullseye",
        "${REGISTRY}/${REPO}:8-fpm",
        "${REGISTRY}/${REPO}:8.2-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.2-fpm",
        "${REGISTRY}/${REPO}:8.2.1-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.2.1-fpm",
        "${REGISTRY}/${REPO}:fpm-bullseye",
        "${REGISTRY}/${REPO}:fpm",
    ]
}

target "8_2-fpm-bullseye" {
    inherits = ["8_2_1-fpm-bullseye"]
}

target "8_2_1-nginx-bullseye" {
    context = "./8.2/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-bullseye",
        "${REGISTRY}/${REPO}:8-nginx",
        "${REGISTRY}/${REPO}:8.2-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.2-nginx",
        "${REGISTRY}/${REPO}:8.2.1-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.2.1-nginx",
        "${REGISTRY}/${REPO}:nginx-bullseye",
        "${REGISTRY}/${REPO}:nginx",
    ]
}

target "8_2-nginx-bullseye" {
    inherits = ["8_2_1-nginx-bullseye"]
}

target "8_2_1-cli-buster" {
    context = "./8.2/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-buster",
        "${REGISTRY}/${REPO}:8-buster",
        "${REGISTRY}/${REPO}:8.2-cli-buster",
        "${REGISTRY}/${REPO}:8.2-buster",
        "${REGISTRY}/${REPO}:8.2.1-cli-buster",
        "${REGISTRY}/${REPO}:8.2.1-buster",
        "${REGISTRY}/${REPO}:cli-buster",
        "${REGISTRY}/${REPO}:buster",
    ]
}

target "8_2-cli-buster" {
    inherits = ["8_2_1-cli-buster"]
}

target "8_2_1-fpm-buster" {
    context = "./8.2/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-buster",
        "${REGISTRY}/${REPO}:8.2-fpm-buster",
        "${REGISTRY}/${REPO}:8.2.1-fpm-buster",
        "${REGISTRY}/${REPO}:fpm-buster",
    ]
}

target "8_2-fpm-buster" {
    inherits = ["8_2_1-fpm-buster"]
}

target "8_2_1-nginx-buster" {
    context = "./8.2/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-buster",
        "${REGISTRY}/${REPO}:8.2-nginx-buster",
        "${REGISTRY}/${REPO}:8.2.1-nginx-buster",
        "${REGISTRY}/${REPO}:nginx-buster",
    ]
}

target "8_2-nginx-buster" {
    inherits = ["8_2_1-nginx-buster"]
}

target "8_2_1-cli-alpine3_17" {
    context = "./8.2/alpine3.17/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.17",
        "${REGISTRY}/${REPO}:8-alpine3.17",
        "${REGISTRY}/${REPO}:8-cli-alpine",
        "${REGISTRY}/${REPO}:8-alpine",
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.17",
        "${REGISTRY}/${REPO}:8.2-alpine3.17",
        "${REGISTRY}/${REPO}:8.2-cli-alpine",
        "${REGISTRY}/${REPO}:8.2-alpine",
        "${REGISTRY}/${REPO}:8.2.1-cli-alpine3.17",
        "${REGISTRY}/${REPO}:8.2.1-alpine3.17",
        "${REGISTRY}/${REPO}:8.2.1-cli-alpine",
        "${REGISTRY}/${REPO}:8.2.1-alpine",
        "${REGISTRY}/${REPO}:cli-alpine3.17",
        "${REGISTRY}/${REPO}:alpine3.17",
        "${REGISTRY}/${REPO}:cli-alpine",
        "${REGISTRY}/${REPO}:alpine",
    ]
}

target "8_2-cli-alpine3_17" {
    inherits = ["8_2_1-cli-alpine3_17"]
}

target "8_2_1-fpm-alpine3_17" {
    context = "./8.2/alpine3.17/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.17",
        "${REGISTRY}/${REPO}:8-fpm-alpine",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.17",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine",
        "${REGISTRY}/${REPO}:8.2.1-fpm-alpine3.17",
        "${REGISTRY}/${REPO}:8.2.1-fpm-alpine",
        "${REGISTRY}/${REPO}:fpm-alpine3.17",
        "${REGISTRY}/${REPO}:fpm-alpine",
    ]
}

target "8_2-fpm-alpine3_17" {
    inherits = ["8_2_1-fpm-alpine3_17"]
}

target "8_2_1-nginx-alpine3_17" {
    context = "./8.2/alpine3.17/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.17",
        "${REGISTRY}/${REPO}:8-nginx-alpine",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.17",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine",
        "${REGISTRY}/${REPO}:8.2.1-nginx-alpine3.17",
        "${REGISTRY}/${REPO}:8.2.1-nginx-alpine",
        "${REGISTRY}/${REPO}:nginx-alpine3.17",
        "${REGISTRY}/${REPO}:nginx-alpine",
    ]
}

target "8_2-nginx-alpine3_17" {
    inherits = ["8_2_1-nginx-alpine3_17"]
}

target "8_2_1-cli-alpine3_16" {
    context = "./8.2/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8-alpine3.16",
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.2-alpine3.16",
        "${REGISTRY}/${REPO}:8.2.1-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.2.1-alpine3.16",
        "${REGISTRY}/${REPO}:cli-alpine3.16",
        "${REGISTRY}/${REPO}:alpine3.16",
    ]
}

target "8_2-cli-alpine3_16" {
    inherits = ["8_2_1-cli-alpine3_16"]
}

target "8_2_1-fpm-alpine3_16" {
    context = "./8.2/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.2.1-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:fpm-alpine3.16",
    ]
}

target "8_2-fpm-alpine3_16" {
    inherits = ["8_2_1-fpm-alpine3_16"]
}

target "8_2_1-nginx-alpine3_16" {
    context = "./8.2/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.2.1-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:nginx-alpine3.16",
    ]
}

target "8_2-nginx-alpine3_16" {
    inherits = ["8_2_1-nginx-alpine3_16"]
}

target "8_1_14-cli-bullseye" {
    context = "./8.1/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-bullseye",
        "${REGISTRY}/${REPO}:8.1-bullseye",
        "${REGISTRY}/${REPO}:8.1-cli",
        "${REGISTRY}/${REPO}:8.1",
        "${REGISTRY}/${REPO}:8.1.14-cli-bullseye",
        "${REGISTRY}/${REPO}:8.1.14-bullseye",
        "${REGISTRY}/${REPO}:8.1.14-cli",
        "${REGISTRY}/${REPO}:8.1.14",
    ]
}

target "8_1-cli-bullseye" {
    inherits = ["8_1_14-cli-bullseye"]
}

target "8_1_14-fpm-bullseye" {
    context = "./8.1/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.1-fpm",
        "${REGISTRY}/${REPO}:8.1.14-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.1.14-fpm",
    ]
}

target "8_1-fpm-bullseye" {
    inherits = ["8_1_14-fpm-bullseye"]
}

target "8_1_14-nginx-bullseye" {
    context = "./8.1/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.1-nginx",
        "${REGISTRY}/${REPO}:8.1.14-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.1.14-nginx",
    ]
}

target "8_1-nginx-bullseye" {
    inherits = ["8_1_14-nginx-bullseye"]
}

target "8_1_14-cli-buster" {
    context = "./8.1/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-buster",
        "${REGISTRY}/${REPO}:8.1-buster",
        "${REGISTRY}/${REPO}:8.1.14-cli-buster",
        "${REGISTRY}/${REPO}:8.1.14-buster",
    ]
}

target "8_1-cli-buster" {
    inherits = ["8_1_14-cli-buster"]
}

target "8_1_14-fpm-buster" {
    context = "./8.1/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-buster",
        "${REGISTRY}/${REPO}:8.1.14-fpm-buster",
    ]
}

target "8_1-fpm-buster" {
    inherits = ["8_1_14-fpm-buster"]
}

target "8_1_14-nginx-buster" {
    context = "./8.1/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-buster",
        "${REGISTRY}/${REPO}:8.1.14-nginx-buster",
    ]
}

target "8_1-nginx-buster" {
    inherits = ["8_1_14-nginx-buster"]
}

target "8_1_14-cli-alpine3_17" {
    context = "./8.1/alpine3.17/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.17",
        "${REGISTRY}/${REPO}:8.1-alpine3.17",
        "${REGISTRY}/${REPO}:8.1-cli-alpine",
        "${REGISTRY}/${REPO}:8.1-alpine",
        "${REGISTRY}/${REPO}:8.1.14-cli-alpine3.17",
        "${REGISTRY}/${REPO}:8.1.14-alpine3.17",
        "${REGISTRY}/${REPO}:8.1.14-cli-alpine",
        "${REGISTRY}/${REPO}:8.1.14-alpine",
    ]
}

target "8_1-cli-alpine3_17" {
    inherits = ["8_1_14-cli-alpine3_17"]
}

target "8_1_14-fpm-alpine3_17" {
    context = "./8.1/alpine3.17/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.17",
        "${REGISTRY}/${REPO}:8.1-fpm-alpine",
        "${REGISTRY}/${REPO}:8.1.14-fpm-alpine3.17",
        "${REGISTRY}/${REPO}:8.1.14-fpm-alpine",
    ]
}

target "8_1-fpm-alpine3_17" {
    inherits = ["8_1_14-fpm-alpine3_17"]
}

target "8_1_14-nginx-alpine3_17" {
    context = "./8.1/alpine3.17/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.17"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.17",
        "${REGISTRY}/${REPO}:8.1-nginx-alpine",
        "${REGISTRY}/${REPO}:8.1.14-nginx-alpine3.17",
        "${REGISTRY}/${REPO}:8.1.14-nginx-alpine",
    ]
}

target "8_1-nginx-alpine3_17" {
    inherits = ["8_1_14-nginx-alpine3_17"]
}

target "8_1_14-cli-alpine3_16" {
    context = "./8.1/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.1-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.14-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.14-alpine3.16",
    ]
}

target "8_1-cli-alpine3_16" {
    inherits = ["8_1_14-cli-alpine3_16"]
}

target "8_1_14-fpm-alpine3_16" {
    context = "./8.1/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.14-fpm-alpine3.16",
    ]
}

target "8_1-fpm-alpine3_16" {
    inherits = ["8_1_14-fpm-alpine3_16"]
}

target "8_1_14-nginx-alpine3_16" {
    context = "./8.1/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.14-nginx-alpine3.16",
    ]
}

target "8_1-nginx-alpine3_16" {
    inherits = ["8_1_14-nginx-alpine3_16"]
}

target "8_0_27-cli-bullseye" {
    context = "./8.0/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0-bullseye",
        "${REGISTRY}/${REPO}:8.0-cli",
        "${REGISTRY}/${REPO}:8.0",
        "${REGISTRY}/${REPO}:8.0.27-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0.27-bullseye",
        "${REGISTRY}/${REPO}:8.0.27-cli",
        "${REGISTRY}/${REPO}:8.0.27",
    ]
}

target "8_0-cli-bullseye" {
    inherits = ["8_0_27-cli-bullseye"]
}

target "8_0_27-fpm-bullseye" {
    context = "./8.0/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0-fpm",
        "${REGISTRY}/${REPO}:8.0.27-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0.27-fpm",
    ]
}

target "8_0-fpm-bullseye" {
    inherits = ["8_0_27-fpm-bullseye"]
}

target "8_0_27-nginx-bullseye" {
    context = "./8.0/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0-nginx",
        "${REGISTRY}/${REPO}:8.0.27-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0.27-nginx",
    ]
}

target "8_0-nginx-bullseye" {
    inherits = ["8_0_27-nginx-bullseye"]
}

target "8_0_27-cli-buster" {
    context = "./8.0/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-buster",
        "${REGISTRY}/${REPO}:8.0-buster",
        "${REGISTRY}/${REPO}:8.0.27-cli-buster",
        "${REGISTRY}/${REPO}:8.0.27-buster",
    ]
}

target "8_0-cli-buster" {
    inherits = ["8_0_27-cli-buster"]
}

target "8_0_27-fpm-buster" {
    context = "./8.0/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster",
        "${REGISTRY}/${REPO}:8.0.27-fpm-buster",
    ]
}

target "8_0-fpm-buster" {
    inherits = ["8_0_27-fpm-buster"]
}

target "8_0_27-nginx-buster" {
    context = "./8.0/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster",
        "${REGISTRY}/${REPO}:8.0.27-nginx-buster",
    ]
}

target "8_0-nginx-buster" {
    inherits = ["8_0_27-nginx-buster"]
}

target "8_0_27-cli-alpine3_16" {
    context = "./8.0/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-cli-alpine",
        "${REGISTRY}/${REPO}:8.0-alpine",
        "${REGISTRY}/${REPO}:8.0.27-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.27-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.27-cli-alpine",
        "${REGISTRY}/${REPO}:8.0.27-alpine",
    ]
}

target "8_0-cli-alpine3_16" {
    inherits = ["8_0_27-cli-alpine3_16"]
}

target "8_0_27-fpm-alpine3_16" {
    context = "./8.0/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-fpm-alpine",
        "${REGISTRY}/${REPO}:8.0.27-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.27-fpm-alpine",
    ]
}

target "8_0-fpm-alpine3_16" {
    inherits = ["8_0_27-fpm-alpine3_16"]
}

target "8_0_27-nginx-alpine3_16" {
    context = "./8.0/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-nginx-alpine",
        "${REGISTRY}/${REPO}:8.0.27-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.27-nginx-alpine",
    ]
}

target "8_0-nginx-alpine3_16" {
    inherits = ["8_0_27-nginx-alpine3_16"]
}
