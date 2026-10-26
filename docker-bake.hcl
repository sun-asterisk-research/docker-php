# NOTE: This file was generated via generate.sh. Don't edit it directly

variable "REGISTRY" {
    default = "ghcr.io"
}

variable "REPO" {
    default = "sun-asterisk-research/php"
}

target "8_2_35-cli-trixie" {
    context = "./8.2/trixie/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-trixie"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-trixie",
        "${REGISTRY}/${REPO}:8-trixie",
        "${REGISTRY}/${REPO}:8-cli",
        "${REGISTRY}/${REPO}:8",
        "${REGISTRY}/${REPO}:8.2-cli-trixie",
        "${REGISTRY}/${REPO}:8.2-trixie",
        "${REGISTRY}/${REPO}:8.2-cli",
        "${REGISTRY}/${REPO}:8.2",
        "${REGISTRY}/${REPO}:8.2.35-cli-trixie",
        "${REGISTRY}/${REPO}:8.2.35-trixie",
        "${REGISTRY}/${REPO}:8.2.35-cli",
        "${REGISTRY}/${REPO}:8.2.35",
        "${REGISTRY}/${REPO}:cli-trixie",
        "${REGISTRY}/${REPO}:trixie",
        "${REGISTRY}/${REPO}:cli",
        "${REGISTRY}/${REPO}:latest",
    ]
}

target "8_2-cli-trixie" {
    inherits = ["8_2_35-cli-trixie"]
}

target "8_2_35-fpm-trixie" {
    context = "./8.2/trixie/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-trixie"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-trixie",
        "${REGISTRY}/${REPO}:8-fpm",
        "${REGISTRY}/${REPO}:8.2-fpm-trixie",
        "${REGISTRY}/${REPO}:8.2-fpm",
        "${REGISTRY}/${REPO}:8.2.35-fpm-trixie",
        "${REGISTRY}/${REPO}:8.2.35-fpm",
        "${REGISTRY}/${REPO}:fpm-trixie",
        "${REGISTRY}/${REPO}:fpm",
    ]
}

target "8_2-fpm-trixie" {
    inherits = ["8_2_35-fpm-trixie"]
}

target "8_2_35-nginx-trixie" {
    context = "./8.2/trixie/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-trixie"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-trixie",
        "${REGISTRY}/${REPO}:8-nginx",
        "${REGISTRY}/${REPO}:8.2-nginx-trixie",
        "${REGISTRY}/${REPO}:8.2-nginx",
        "${REGISTRY}/${REPO}:8.2.35-nginx-trixie",
        "${REGISTRY}/${REPO}:8.2.35-nginx",
        "${REGISTRY}/${REPO}:nginx-trixie",
        "${REGISTRY}/${REPO}:nginx",
    ]
}

target "8_2-nginx-trixie" {
    inherits = ["8_2_35-nginx-trixie"]
}

target "8_2_35-cli-bookworm" {
    context = "./8.2/bookworm/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-bookworm",
        "${REGISTRY}/${REPO}:8-bookworm",
        "${REGISTRY}/${REPO}:8.2-cli-bookworm",
        "${REGISTRY}/${REPO}:8.2-bookworm",
        "${REGISTRY}/${REPO}:8.2.35-cli-bookworm",
        "${REGISTRY}/${REPO}:8.2.35-bookworm",
        "${REGISTRY}/${REPO}:cli-bookworm",
        "${REGISTRY}/${REPO}:bookworm",
    ]
}

target "8_2-cli-bookworm" {
    inherits = ["8_2_35-cli-bookworm"]
}

target "8_2_35-fpm-bookworm" {
    context = "./8.2/bookworm/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-bookworm",
        "${REGISTRY}/${REPO}:8.2-fpm-bookworm",
        "${REGISTRY}/${REPO}:8.2.35-fpm-bookworm",
        "${REGISTRY}/${REPO}:fpm-bookworm",
    ]
}

target "8_2-fpm-bookworm" {
    inherits = ["8_2_35-fpm-bookworm"]
}

target "8_2_35-nginx-bookworm" {
    context = "./8.2/bookworm/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-bookworm",
        "${REGISTRY}/${REPO}:8.2-nginx-bookworm",
        "${REGISTRY}/${REPO}:8.2.35-nginx-bookworm",
        "${REGISTRY}/${REPO}:nginx-bookworm",
    ]
}

target "8_2-nginx-bookworm" {
    inherits = ["8_2_35-nginx-bookworm"]
}

target "8_2_35-cli-alpine3_24" {
    context = "./8.2/alpine3.24/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.24"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.24",
        "${REGISTRY}/${REPO}:8-alpine3.24",
        "${REGISTRY}/${REPO}:8-cli-alpine",
        "${REGISTRY}/${REPO}:8-alpine",
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.24",
        "${REGISTRY}/${REPO}:8.2-alpine3.24",
        "${REGISTRY}/${REPO}:8.2-cli-alpine",
        "${REGISTRY}/${REPO}:8.2-alpine",
        "${REGISTRY}/${REPO}:8.2.35-cli-alpine3.24",
        "${REGISTRY}/${REPO}:8.2.35-alpine3.24",
        "${REGISTRY}/${REPO}:8.2.35-cli-alpine",
        "${REGISTRY}/${REPO}:8.2.35-alpine",
        "${REGISTRY}/${REPO}:cli-alpine3.24",
        "${REGISTRY}/${REPO}:alpine3.24",
        "${REGISTRY}/${REPO}:cli-alpine",
        "${REGISTRY}/${REPO}:alpine",
    ]
}

target "8_2-cli-alpine3_24" {
    inherits = ["8_2_35-cli-alpine3_24"]
}

target "8_2_35-fpm-alpine3_24" {
    context = "./8.2/alpine3.24/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.24"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.24",
        "${REGISTRY}/${REPO}:8-fpm-alpine",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.24",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine",
        "${REGISTRY}/${REPO}:8.2.35-fpm-alpine3.24",
        "${REGISTRY}/${REPO}:8.2.35-fpm-alpine",
        "${REGISTRY}/${REPO}:fpm-alpine3.24",
        "${REGISTRY}/${REPO}:fpm-alpine",
    ]
}

target "8_2-fpm-alpine3_24" {
    inherits = ["8_2_35-fpm-alpine3_24"]
}

target "8_2_35-nginx-alpine3_24" {
    context = "./8.2/alpine3.24/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.24"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.24",
        "${REGISTRY}/${REPO}:8-nginx-alpine",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.24",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine",
        "${REGISTRY}/${REPO}:8.2.35-nginx-alpine3.24",
        "${REGISTRY}/${REPO}:8.2.35-nginx-alpine",
        "${REGISTRY}/${REPO}:nginx-alpine3.24",
        "${REGISTRY}/${REPO}:nginx-alpine",
    ]
}

target "8_2-nginx-alpine3_24" {
    inherits = ["8_2_35-nginx-alpine3_24"]
}

target "8_2_35-cli-alpine3_23" {
    context = "./8.2/alpine3.23/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.23"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.23",
        "${REGISTRY}/${REPO}:8-alpine3.23",
        "${REGISTRY}/${REPO}:8.2-cli-alpine3.23",
        "${REGISTRY}/${REPO}:8.2-alpine3.23",
        "${REGISTRY}/${REPO}:8.2.35-cli-alpine3.23",
        "${REGISTRY}/${REPO}:8.2.35-alpine3.23",
        "${REGISTRY}/${REPO}:cli-alpine3.23",
        "${REGISTRY}/${REPO}:alpine3.23",
    ]
}

target "8_2-cli-alpine3_23" {
    inherits = ["8_2_35-cli-alpine3_23"]
}

target "8_2_35-fpm-alpine3_23" {
    context = "./8.2/alpine3.23/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.23"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.23",
        "${REGISTRY}/${REPO}:8.2-fpm-alpine3.23",
        "${REGISTRY}/${REPO}:8.2.35-fpm-alpine3.23",
        "${REGISTRY}/${REPO}:fpm-alpine3.23",
    ]
}

target "8_2-fpm-alpine3_23" {
    inherits = ["8_2_35-fpm-alpine3_23"]
}

target "8_2_35-nginx-alpine3_23" {
    context = "./8.2/alpine3.23/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.23"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.23",
        "${REGISTRY}/${REPO}:8.2-nginx-alpine3.23",
        "${REGISTRY}/${REPO}:8.2.35-nginx-alpine3.23",
        "${REGISTRY}/${REPO}:nginx-alpine3.23",
    ]
}

target "8_2-nginx-alpine3_23" {
    inherits = ["8_2_35-nginx-alpine3_23"]
}

target "7_4_33-cli-alpine3_16" {
    context = "./7.4/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-cli-alpine",
        "${REGISTRY}/${REPO}:7.4.33-cli-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.33-cli-alpine",
    ]
}

target "7_4-cli-alpine3_16" {
    inherits = ["7_4_33-cli-alpine3_16"]
}

target "7_4_33-fpm-alpine3_16" {
    context = "./7.4/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-fpm-alpine",
        "${REGISTRY}/${REPO}:7.4.33-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.33-fpm-alpine",
    ]
}

target "7_4-fpm-alpine3_16" {
    inherits = ["7_4_33-fpm-alpine3_16"]
}

target "7_4_33-nginx-alpine3_16" {
    context = "./7.4/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-nginx-alpine",
        "${REGISTRY}/${REPO}:7.4.33-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.33-nginx-alpine",
    ]
}

target "7_4-nginx-alpine3_16" {
    inherits = ["7_4_33-nginx-alpine3_16"]
}

target "8_0_30-cli-bullseye" {
    context = "./8.0/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0-bullseye",
        "${REGISTRY}/${REPO}:8.0-cli",
        "${REGISTRY}/${REPO}:8.0",
        "${REGISTRY}/${REPO}:8.0.30-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0.30-bullseye",
        "${REGISTRY}/${REPO}:8.0.30-cli",
        "${REGISTRY}/${REPO}:8.0.30",
    ]
}

target "8_0-cli-bullseye" {
    inherits = ["8_0_30-cli-bullseye"]
}

target "8_0_30-fpm-bullseye" {
    context = "./8.0/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0-fpm",
        "${REGISTRY}/${REPO}:8.0.30-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0.30-fpm",
    ]
}

target "8_0-fpm-bullseye" {
    inherits = ["8_0_30-fpm-bullseye"]
}

target "8_0_30-nginx-bullseye" {
    context = "./8.0/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0-nginx",
        "${REGISTRY}/${REPO}:8.0.30-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0.30-nginx",
    ]
}

target "8_0-nginx-bullseye" {
    inherits = ["8_0_30-nginx-bullseye"]
}

target "8_0_30-cli-buster" {
    context = "./8.0/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-buster",
        "${REGISTRY}/${REPO}:8.0-buster",
        "${REGISTRY}/${REPO}:8.0.30-cli-buster",
        "${REGISTRY}/${REPO}:8.0.30-buster",
    ]
}

target "8_0-cli-buster" {
    inherits = ["8_0_30-cli-buster"]
}

target "8_0_30-fpm-buster" {
    context = "./8.0/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster",
        "${REGISTRY}/${REPO}:8.0.30-fpm-buster",
    ]
}

target "8_0-fpm-buster" {
    inherits = ["8_0_30-fpm-buster"]
}

target "8_0_30-nginx-buster" {
    context = "./8.0/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster",
        "${REGISTRY}/${REPO}:8.0.30-nginx-buster",
    ]
}

target "8_0-nginx-buster" {
    inherits = ["8_0_30-nginx-buster"]
}

target "8_0_30-cli-alpine3_16" {
    context = "./8.0/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-cli-alpine",
        "${REGISTRY}/${REPO}:8.0-alpine",
        "${REGISTRY}/${REPO}:8.0.30-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.30-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.30-cli-alpine",
        "${REGISTRY}/${REPO}:8.0.30-alpine",
    ]
}

target "8_0-cli-alpine3_16" {
    inherits = ["8_0_30-cli-alpine3_16"]
}

target "8_0_30-fpm-alpine3_16" {
    context = "./8.0/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-fpm-alpine",
        "${REGISTRY}/${REPO}:8.0.30-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.30-fpm-alpine",
    ]
}

target "8_0-fpm-alpine3_16" {
    inherits = ["8_0_30-fpm-alpine3_16"]
}

target "8_0_30-nginx-alpine3_16" {
    context = "./8.0/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-nginx-alpine",
        "${REGISTRY}/${REPO}:8.0.30-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.30-nginx-alpine",
    ]
}

target "8_0-nginx-alpine3_16" {
    inherits = ["8_0_30-nginx-alpine3_16"]
}

target "8_1_34-cli-bookworm" {
    context = "./8.1/bookworm/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-bookworm",
        "${REGISTRY}/${REPO}:8.1-bookworm",
        "${REGISTRY}/${REPO}:8.1-cli",
        "${REGISTRY}/${REPO}:8.1",
        "${REGISTRY}/${REPO}:8.1.34-cli-bookworm",
        "${REGISTRY}/${REPO}:8.1.34-bookworm",
        "${REGISTRY}/${REPO}:8.1.34-cli",
        "${REGISTRY}/${REPO}:8.1.34",
    ]
}

target "8_1-cli-bookworm" {
    inherits = ["8_1_34-cli-bookworm"]
}

target "8_1_34-fpm-bookworm" {
    context = "./8.1/bookworm/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-bookworm",
        "${REGISTRY}/${REPO}:8.1-fpm",
        "${REGISTRY}/${REPO}:8.1.34-fpm-bookworm",
        "${REGISTRY}/${REPO}:8.1.34-fpm",
    ]
}

target "8_1-fpm-bookworm" {
    inherits = ["8_1_34-fpm-bookworm"]
}

target "8_1_34-nginx-bookworm" {
    context = "./8.1/bookworm/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-bookworm"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-bookworm",
        "${REGISTRY}/${REPO}:8.1-nginx",
        "${REGISTRY}/${REPO}:8.1.34-nginx-bookworm",
        "${REGISTRY}/${REPO}:8.1.34-nginx",
    ]
}

target "8_1-nginx-bookworm" {
    inherits = ["8_1_34-nginx-bookworm"]
}

target "8_1_34-cli-alpine3_22" {
    context = "./8.1/alpine3.22/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.22"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.22",
        "${REGISTRY}/${REPO}:8.1-alpine3.22",
        "${REGISTRY}/${REPO}:8.1-cli-alpine",
        "${REGISTRY}/${REPO}:8.1-alpine",
        "${REGISTRY}/${REPO}:8.1.34-cli-alpine3.22",
        "${REGISTRY}/${REPO}:8.1.34-alpine3.22",
        "${REGISTRY}/${REPO}:8.1.34-cli-alpine",
        "${REGISTRY}/${REPO}:8.1.34-alpine",
    ]
}

target "8_1-cli-alpine3_22" {
    inherits = ["8_1_34-cli-alpine3_22"]
}

target "8_1_34-fpm-alpine3_22" {
    context = "./8.1/alpine3.22/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.22"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.22",
        "${REGISTRY}/${REPO}:8.1-fpm-alpine",
        "${REGISTRY}/${REPO}:8.1.34-fpm-alpine3.22",
        "${REGISTRY}/${REPO}:8.1.34-fpm-alpine",
    ]
}

target "8_1-fpm-alpine3_22" {
    inherits = ["8_1_34-fpm-alpine3_22"]
}

target "8_1_34-nginx-alpine3_22" {
    context = "./8.1/alpine3.22/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.22"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.22",
        "${REGISTRY}/${REPO}:8.1-nginx-alpine",
        "${REGISTRY}/${REPO}:8.1.34-nginx-alpine3.22",
        "${REGISTRY}/${REPO}:8.1.34-nginx-alpine",
    ]
}

target "8_1-nginx-alpine3_22" {
    inherits = ["8_1_34-nginx-alpine3_22"]
}
