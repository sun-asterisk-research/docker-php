# NOTE: This file was generated via generate.sh. Don't edit it directly

variable "REGISTRY" {
    default = ""
}

variable "REPO" {
    default = "sunasteriskrnd/php"
}

group "default" {
    targets = [
        "8.1.6-cli-buster",
        "8.1.6-fpm-buster",
        "8.1.6-nginx-buster",
        "8.1.6-cli-bullseye",
        "8.1.6-fpm-bullseye",
        "8.1.6-nginx-bullseye",
        "8.1.6-cli-alpine3.15",
        "8.1.6-fpm-alpine3.15",
        "8.1.6-nginx-alpine3.15",
        "8.1.6-cli-alpine3.14",
        "8.1.6-fpm-alpine3.14",
        "8.1.6-nginx-alpine3.14",
        "8.0.19-cli-buster",
        "8.0.19-fpm-buster",
        "8.0.19-nginx-buster",
        "8.0.19-cli-bullseye",
        "8.0.19-fpm-bullseye",
        "8.0.19-nginx-bullseye",
        "8.0.19-cli-alpine3.15",
        "8.0.19-fpm-alpine3.15",
        "8.0.19-nginx-alpine3.15",
        "8.0.19-cli-alpine3.14",
        "8.0.19-fpm-alpine3.14",
        "8.0.19-nginx-alpine3.14",
        "7.4.29-cli-buster",
        "7.4.29-fpm-buster",
        "7.4.29-nginx-buster",
        "7.4.29-cli-bullseye",
        "7.4.29-fpm-bullseye",
        "7.4.29-nginx-bullseye",
        "7.4.29-cli-alpine3.15",
        "7.4.29-fpm-alpine3.15",
        "7.4.29-nginx-alpine3.15",
        "7.4.29-cli-alpine3.14",
        "7.4.29-fpm-alpine3.14",
        "7.4.29-nginx-alpine3.14",
        "7.3.33-cli-buster",
        "7.3.33-fpm-buster",
        "7.3.33-nginx-buster",
        "7.3.33-cli-bullseye",
        "7.3.33-fpm-bullseye",
        "7.3.33-nginx-bullseye",
        "7.3.33-cli-alpine3.15",
        "7.3.33-fpm-alpine3.15",
        "7.3.33-nginx-alpine3.15",
        "7.3.33-cli-alpine3.14",
        "7.3.33-fpm-alpine3.14",
        "7.3.33-nginx-alpine3.14",
    ]
}

target "8.1.6-cli-buster" {
    context = "./8.1/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-cli-buster",
        "${REGISTRY}${REPO}:8-buster",
        "${REGISTRY}${REPO}:8.1-cli-buster",
        "${REGISTRY}${REPO}:8.1-buster",
        "${REGISTRY}${REPO}:8.1.6-cli-buster",
        "${REGISTRY}${REPO}:8.1.6-buster",
        "${REGISTRY}${REPO}:cli-buster",
        "${REGISTRY}${REPO}:buster",
    ]
}

target "8.1-cli-buster" {
    inherits = ["8.1.6-cli-buster"]
}

target "8.1.6-fpm-buster" {
    context = "./8.1/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-fpm-buster",
        "${REGISTRY}${REPO}:8.1-fpm-buster",
        "${REGISTRY}${REPO}:8.1.6-fpm-buster",
        "${REGISTRY}${REPO}:fpm-buster",
    ]
}

target "8.1-fpm-buster" {
    inherits = ["8.1.6-fpm-buster"]
}

target "8.1.6-nginx-buster" {
    context = "./8.1/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-nginx-buster",
        "${REGISTRY}${REPO}:8.1-nginx-buster",
        "${REGISTRY}${REPO}:8.1.6-nginx-buster",
        "${REGISTRY}${REPO}:nginx-buster",
    ]
}

target "8.1-nginx-buster" {
    inherits = ["8.1.6-nginx-buster"]
}

target "8.1.6-cli-bullseye" {
    context = "./8.1/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-cli-bullseye",
        "${REGISTRY}${REPO}:8-cli",
        "${REGISTRY}${REPO}:8-bullseye",
        "${REGISTRY}${REPO}:8",
        "${REGISTRY}${REPO}:8.1-cli-bullseye",
        "${REGISTRY}${REPO}:8.1-cli",
        "${REGISTRY}${REPO}:8.1-bullseye",
        "${REGISTRY}${REPO}:8.1",
        "${REGISTRY}${REPO}:8.1.6-cli-bullseye",
        "${REGISTRY}${REPO}:8.1.6-cli",
        "${REGISTRY}${REPO}:8.1.6-bullseye",
        "${REGISTRY}${REPO}:8.1.6",
        "${REGISTRY}${REPO}:cli-bullseye",
        "${REGISTRY}${REPO}:cli",
        "${REGISTRY}${REPO}:bullseye",
        "${REGISTRY}${REPO}:latest",
    ]
}

target "8.1-cli-bullseye" {
    inherits = ["8.1.6-cli-bullseye"]
}

target "8.1.6-fpm-bullseye" {
    context = "./8.1/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-fpm-bullseye",
        "${REGISTRY}${REPO}:8-fpm",
        "${REGISTRY}${REPO}:8.1-fpm-bullseye",
        "${REGISTRY}${REPO}:8.1-fpm",
        "${REGISTRY}${REPO}:8.1.6-fpm-bullseye",
        "${REGISTRY}${REPO}:8.1.6-fpm",
        "${REGISTRY}${REPO}:fpm-bullseye",
        "${REGISTRY}${REPO}:fpm",
    ]
}

target "8.1-fpm-bullseye" {
    inherits = ["8.1.6-fpm-bullseye"]
}

target "8.1.6-nginx-bullseye" {
    context = "./8.1/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-nginx-bullseye",
        "${REGISTRY}${REPO}:8-nginx",
        "${REGISTRY}${REPO}:8.1-nginx-bullseye",
        "${REGISTRY}${REPO}:8.1-nginx",
        "${REGISTRY}${REPO}:8.1.6-nginx-bullseye",
        "${REGISTRY}${REPO}:8.1.6-nginx",
        "${REGISTRY}${REPO}:nginx-bullseye",
        "${REGISTRY}${REPO}:nginx",
    ]
}

target "8.1-nginx-bullseye" {
    inherits = ["8.1.6-nginx-bullseye"]
}

target "8.1.6-cli-alpine3.15" {
    context = "./8.1/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-cli-alpine3.15",
        "${REGISTRY}${REPO}:8-cli-alpine",
        "${REGISTRY}${REPO}:8-alpine3.15",
        "${REGISTRY}${REPO}:8-alpine",
        "${REGISTRY}${REPO}:8.1-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.1-cli-alpine",
        "${REGISTRY}${REPO}:8.1-alpine3.15",
        "${REGISTRY}${REPO}:8.1-alpine",
        "${REGISTRY}${REPO}:8.1.6-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.1.6-cli-alpine",
        "${REGISTRY}${REPO}:8.1.6-alpine3.15",
        "${REGISTRY}${REPO}:8.1.6-alpine",
        "${REGISTRY}${REPO}:cli-alpine3.15",
        "${REGISTRY}${REPO}:cli-alpine",
        "${REGISTRY}${REPO}:alpine3.15",
        "${REGISTRY}${REPO}:alpine",
    ]
}

target "8.1-cli-alpine3.15" {
    inherits = ["8.1.6-cli-alpine3.15"]
}

target "8.1.6-fpm-alpine3.15" {
    context = "./8.1/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8-fpm-alpine",
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.1-fpm-alpine",
        "${REGISTRY}${REPO}:8.1.6-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.1.6-fpm-alpine",
        "${REGISTRY}${REPO}:fpm-alpine3.15",
        "${REGISTRY}${REPO}:fpm-alpine",
    ]
}

target "8.1-fpm-alpine3.15" {
    inherits = ["8.1.6-fpm-alpine3.15"]
}

target "8.1.6-nginx-alpine3.15" {
    context = "./8.1/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8-nginx-alpine",
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.1-nginx-alpine",
        "${REGISTRY}${REPO}:8.1.6-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.1.6-nginx-alpine",
        "${REGISTRY}${REPO}:nginx-alpine3.15",
        "${REGISTRY}${REPO}:nginx-alpine",
    ]
}

target "8.1-nginx-alpine3.15" {
    inherits = ["8.1.6-nginx-alpine3.15"]
}

target "8.1.6-cli-alpine3.14" {
    context = "./8.1/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-cli-alpine3.14",
        "${REGISTRY}${REPO}:8-alpine3.14",
        "${REGISTRY}${REPO}:8.1-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.1-alpine3.14",
        "${REGISTRY}${REPO}:8.1.6-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.1.6-alpine3.14",
        "${REGISTRY}${REPO}:cli-alpine3.14",
        "${REGISTRY}${REPO}:alpine3.14",
    ]
}

target "8.1-cli-alpine3.14" {
    inherits = ["8.1.6-cli-alpine3.14"]
}

target "8.1.6-fpm-alpine3.14" {
    context = "./8.1/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-fpm-alpine3.14",
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.14",
        "${REGISTRY}${REPO}:8.1.6-fpm-alpine3.14",
        "${REGISTRY}${REPO}:fpm-alpine3.14",
    ]
}

target "8.1-fpm-alpine3.14" {
    inherits = ["8.1.6-fpm-alpine3.14"]
}

target "8.1.6-nginx-alpine3.14" {
    context = "./8.1/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8-nginx-alpine3.14",
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.14",
        "${REGISTRY}${REPO}:8.1.6-nginx-alpine3.14",
        "${REGISTRY}${REPO}:nginx-alpine3.14",
    ]
}

target "8.1-nginx-alpine3.14" {
    inherits = ["8.1.6-nginx-alpine3.14"]
}

target "8.0.19-cli-buster" {
    context = "./8.0/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-buster",
        "${REGISTRY}${REPO}:8.0-buster",
        "${REGISTRY}${REPO}:8.0.19-cli-buster",
        "${REGISTRY}${REPO}:8.0.19-buster",
    ]
}

target "8.0-cli-buster" {
    inherits = ["8.0.19-cli-buster"]
}

target "8.0.19-fpm-buster" {
    context = "./8.0/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-buster",
        "${REGISTRY}${REPO}:8.0.19-fpm-buster",
    ]
}

target "8.0-fpm-buster" {
    inherits = ["8.0.19-fpm-buster"]
}

target "8.0.19-nginx-buster" {
    context = "./8.0/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-buster",
        "${REGISTRY}${REPO}:8.0.19-nginx-buster",
    ]
}

target "8.0-nginx-buster" {
    inherits = ["8.0.19-nginx-buster"]
}

target "8.0.19-cli-bullseye" {
    context = "./8.0/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-bullseye",
        "${REGISTRY}${REPO}:8.0-cli",
        "${REGISTRY}${REPO}:8.0-bullseye",
        "${REGISTRY}${REPO}:8.0",
        "${REGISTRY}${REPO}:8.0.19-cli-bullseye",
        "${REGISTRY}${REPO}:8.0.19-cli",
        "${REGISTRY}${REPO}:8.0.19-bullseye",
        "${REGISTRY}${REPO}:8.0.19",
    ]
}

target "8.0-cli-bullseye" {
    inherits = ["8.0.19-cli-bullseye"]
}

target "8.0.19-fpm-bullseye" {
    context = "./8.0/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-bullseye",
        "${REGISTRY}${REPO}:8.0-fpm",
        "${REGISTRY}${REPO}:8.0.19-fpm-bullseye",
        "${REGISTRY}${REPO}:8.0.19-fpm",
    ]
}

target "8.0-fpm-bullseye" {
    inherits = ["8.0.19-fpm-bullseye"]
}

target "8.0.19-nginx-bullseye" {
    context = "./8.0/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-bullseye",
        "${REGISTRY}${REPO}:8.0-nginx",
        "${REGISTRY}${REPO}:8.0.19-nginx-bullseye",
        "${REGISTRY}${REPO}:8.0.19-nginx",
    ]
}

target "8.0-nginx-bullseye" {
    inherits = ["8.0.19-nginx-bullseye"]
}

target "8.0.19-cli-alpine3.15" {
    context = "./8.0/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.0-cli-alpine",
        "${REGISTRY}${REPO}:8.0-alpine3.15",
        "${REGISTRY}${REPO}:8.0-alpine",
        "${REGISTRY}${REPO}:8.0.19-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.0.19-cli-alpine",
        "${REGISTRY}${REPO}:8.0.19-alpine3.15",
        "${REGISTRY}${REPO}:8.0.19-alpine",
    ]
}

target "8.0-cli-alpine3.15" {
    inherits = ["8.0.19-cli-alpine3.15"]
}

target "8.0.19-fpm-alpine3.15" {
    context = "./8.0/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.0-fpm-alpine",
        "${REGISTRY}${REPO}:8.0.19-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.0.19-fpm-alpine",
    ]
}

target "8.0-fpm-alpine3.15" {
    inherits = ["8.0.19-fpm-alpine3.15"]
}

target "8.0.19-nginx-alpine3.15" {
    context = "./8.0/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.0-nginx-alpine",
        "${REGISTRY}${REPO}:8.0.19-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.0.19-nginx-alpine",
    ]
}

target "8.0-nginx-alpine3.15" {
    inherits = ["8.0.19-nginx-alpine3.15"]
}

target "8.0.19-cli-alpine3.14" {
    context = "./8.0/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.0-alpine3.14",
        "${REGISTRY}${REPO}:8.0.19-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.0.19-alpine3.14",
    ]
}

target "8.0-cli-alpine3.14" {
    inherits = ["8.0.19-cli-alpine3.14"]
}

target "8.0.19-fpm-alpine3.14" {
    context = "./8.0/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.14",
        "${REGISTRY}${REPO}:8.0.19-fpm-alpine3.14",
    ]
}

target "8.0-fpm-alpine3.14" {
    inherits = ["8.0.19-fpm-alpine3.14"]
}

target "8.0.19-nginx-alpine3.14" {
    context = "./8.0/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.14",
        "${REGISTRY}${REPO}:8.0.19-nginx-alpine3.14",
    ]
}

target "8.0-nginx-alpine3.14" {
    inherits = ["8.0.19-nginx-alpine3.14"]
}

target "7.4.29-cli-buster" {
    context = "./7.4/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-cli-buster",
        "${REGISTRY}${REPO}:7-buster",
        "${REGISTRY}${REPO}:7.4-cli-buster",
        "${REGISTRY}${REPO}:7.4-buster",
        "${REGISTRY}${REPO}:7.4.29-cli-buster",
        "${REGISTRY}${REPO}:7.4.29-buster",
    ]
}

target "7.4-cli-buster" {
    inherits = ["7.4.29-cli-buster"]
}

target "7.4.29-fpm-buster" {
    context = "./7.4/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-fpm-buster",
        "${REGISTRY}${REPO}:7.4-fpm-buster",
        "${REGISTRY}${REPO}:7.4.29-fpm-buster",
    ]
}

target "7.4-fpm-buster" {
    inherits = ["7.4.29-fpm-buster"]
}

target "7.4.29-nginx-buster" {
    context = "./7.4/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-nginx-buster",
        "${REGISTRY}${REPO}:7.4-nginx-buster",
        "${REGISTRY}${REPO}:7.4.29-nginx-buster",
    ]
}

target "7.4-nginx-buster" {
    inherits = ["7.4.29-nginx-buster"]
}

target "7.4.29-cli-bullseye" {
    context = "./7.4/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-cli-bullseye",
        "${REGISTRY}${REPO}:7-cli",
        "${REGISTRY}${REPO}:7-bullseye",
        "${REGISTRY}${REPO}:7",
        "${REGISTRY}${REPO}:7.4-cli-bullseye",
        "${REGISTRY}${REPO}:7.4-cli",
        "${REGISTRY}${REPO}:7.4-bullseye",
        "${REGISTRY}${REPO}:7.4",
        "${REGISTRY}${REPO}:7.4.29-cli-bullseye",
        "${REGISTRY}${REPO}:7.4.29-cli",
        "${REGISTRY}${REPO}:7.4.29-bullseye",
        "${REGISTRY}${REPO}:7.4.29",
    ]
}

target "7.4-cli-bullseye" {
    inherits = ["7.4.29-cli-bullseye"]
}

target "7.4.29-fpm-bullseye" {
    context = "./7.4/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-fpm-bullseye",
        "${REGISTRY}${REPO}:7-fpm",
        "${REGISTRY}${REPO}:7.4-fpm-bullseye",
        "${REGISTRY}${REPO}:7.4-fpm",
        "${REGISTRY}${REPO}:7.4.29-fpm-bullseye",
        "${REGISTRY}${REPO}:7.4.29-fpm",
    ]
}

target "7.4-fpm-bullseye" {
    inherits = ["7.4.29-fpm-bullseye"]
}

target "7.4.29-nginx-bullseye" {
    context = "./7.4/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-nginx-bullseye",
        "${REGISTRY}${REPO}:7-nginx",
        "${REGISTRY}${REPO}:7.4-nginx-bullseye",
        "${REGISTRY}${REPO}:7.4-nginx",
        "${REGISTRY}${REPO}:7.4.29-nginx-bullseye",
        "${REGISTRY}${REPO}:7.4.29-nginx",
    ]
}

target "7.4-nginx-bullseye" {
    inherits = ["7.4.29-nginx-bullseye"]
}

target "7.4.29-cli-alpine3.15" {
    context = "./7.4/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-cli-alpine3.15",
        "${REGISTRY}${REPO}:7-cli-alpine",
        "${REGISTRY}${REPO}:7-alpine3.15",
        "${REGISTRY}${REPO}:7-alpine",
        "${REGISTRY}${REPO}:7.4-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.4-cli-alpine",
        "${REGISTRY}${REPO}:7.4-alpine3.15",
        "${REGISTRY}${REPO}:7.4-alpine",
        "${REGISTRY}${REPO}:7.4.29-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.4.29-cli-alpine",
        "${REGISTRY}${REPO}:7.4.29-alpine3.15",
        "${REGISTRY}${REPO}:7.4.29-alpine",
    ]
}

target "7.4-cli-alpine3.15" {
    inherits = ["7.4.29-cli-alpine3.15"]
}

target "7.4.29-fpm-alpine3.15" {
    context = "./7.4/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7-fpm-alpine",
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.4-fpm-alpine",
        "${REGISTRY}${REPO}:7.4.29-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.4.29-fpm-alpine",
    ]
}

target "7.4-fpm-alpine3.15" {
    inherits = ["7.4.29-fpm-alpine3.15"]
}

target "7.4.29-nginx-alpine3.15" {
    context = "./7.4/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7-nginx-alpine",
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.4-nginx-alpine",
        "${REGISTRY}${REPO}:7.4.29-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.4.29-nginx-alpine",
    ]
}

target "7.4-nginx-alpine3.15" {
    inherits = ["7.4.29-nginx-alpine3.15"]
}

target "7.4.29-cli-alpine3.14" {
    context = "./7.4/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-cli-alpine3.14",
        "${REGISTRY}${REPO}:7-alpine3.14",
        "${REGISTRY}${REPO}:7.4-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.4-alpine3.14",
        "${REGISTRY}${REPO}:7.4.29-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.4.29-alpine3.14",
    ]
}

target "7.4-cli-alpine3.14" {
    inherits = ["7.4.29-cli-alpine3.14"]
}

target "7.4.29-fpm-alpine3.14" {
    context = "./7.4/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-fpm-alpine3.14",
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.14",
        "${REGISTRY}${REPO}:7.4.29-fpm-alpine3.14",
    ]
}

target "7.4-fpm-alpine3.14" {
    inherits = ["7.4.29-fpm-alpine3.14"]
}

target "7.4.29-nginx-alpine3.14" {
    context = "./7.4/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7-nginx-alpine3.14",
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.14",
        "${REGISTRY}${REPO}:7.4.29-nginx-alpine3.14",
    ]
}

target "7.4-nginx-alpine3.14" {
    inherits = ["7.4.29-nginx-alpine3.14"]
}

target "7.3.33-cli-buster" {
    context = "./7.3/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-cli-buster",
        "${REGISTRY}${REPO}:7.3-buster",
        "${REGISTRY}${REPO}:7.3.33-cli-buster",
        "${REGISTRY}${REPO}:7.3.33-buster",
    ]
}

target "7.3-cli-buster" {
    inherits = ["7.3.33-cli-buster"]
}

target "7.3.33-fpm-buster" {
    context = "./7.3/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-fpm-buster",
        "${REGISTRY}${REPO}:7.3.33-fpm-buster",
    ]
}

target "7.3-fpm-buster" {
    inherits = ["7.3.33-fpm-buster"]
}

target "7.3.33-nginx-buster" {
    context = "./7.3/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-nginx-buster",
        "${REGISTRY}${REPO}:7.3.33-nginx-buster",
    ]
}

target "7.3-nginx-buster" {
    inherits = ["7.3.33-nginx-buster"]
}

target "7.3.33-cli-bullseye" {
    context = "./7.3/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-cli-bullseye",
        "${REGISTRY}${REPO}:7.3-cli",
        "${REGISTRY}${REPO}:7.3-bullseye",
        "${REGISTRY}${REPO}:7.3",
        "${REGISTRY}${REPO}:7.3.33-cli-bullseye",
        "${REGISTRY}${REPO}:7.3.33-cli",
        "${REGISTRY}${REPO}:7.3.33-bullseye",
        "${REGISTRY}${REPO}:7.3.33",
    ]
}

target "7.3-cli-bullseye" {
    inherits = ["7.3.33-cli-bullseye"]
}

target "7.3.33-fpm-bullseye" {
    context = "./7.3/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-fpm-bullseye",
        "${REGISTRY}${REPO}:7.3-fpm",
        "${REGISTRY}${REPO}:7.3.33-fpm-bullseye",
        "${REGISTRY}${REPO}:7.3.33-fpm",
    ]
}

target "7.3-fpm-bullseye" {
    inherits = ["7.3.33-fpm-bullseye"]
}

target "7.3.33-nginx-bullseye" {
    context = "./7.3/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-nginx-bullseye",
        "${REGISTRY}${REPO}:7.3-nginx",
        "${REGISTRY}${REPO}:7.3.33-nginx-bullseye",
        "${REGISTRY}${REPO}:7.3.33-nginx",
    ]
}

target "7.3-nginx-bullseye" {
    inherits = ["7.3.33-nginx-bullseye"]
}

target "7.3.33-cli-alpine3.15" {
    context = "./7.3/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.3-cli-alpine",
        "${REGISTRY}${REPO}:7.3-alpine3.15",
        "${REGISTRY}${REPO}:7.3-alpine",
        "${REGISTRY}${REPO}:7.3.33-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.3.33-cli-alpine",
        "${REGISTRY}${REPO}:7.3.33-alpine3.15",
        "${REGISTRY}${REPO}:7.3.33-alpine",
    ]
}

target "7.3-cli-alpine3.15" {
    inherits = ["7.3.33-cli-alpine3.15"]
}

target "7.3.33-fpm-alpine3.15" {
    context = "./7.3/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.3-fpm-alpine",
        "${REGISTRY}${REPO}:7.3.33-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.3.33-fpm-alpine",
    ]
}

target "7.3-fpm-alpine3.15" {
    inherits = ["7.3.33-fpm-alpine3.15"]
}

target "7.3.33-nginx-alpine3.15" {
    context = "./7.3/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.3-nginx-alpine",
        "${REGISTRY}${REPO}:7.3.33-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.3.33-nginx-alpine",
    ]
}

target "7.3-nginx-alpine3.15" {
    inherits = ["7.3.33-nginx-alpine3.15"]
}

target "7.3.33-cli-alpine3.14" {
    context = "./7.3/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.3-alpine3.14",
        "${REGISTRY}${REPO}:7.3.33-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.3.33-alpine3.14",
    ]
}

target "7.3-cli-alpine3.14" {
    inherits = ["7.3.33-cli-alpine3.14"]
}

target "7.3.33-fpm-alpine3.14" {
    context = "./7.3/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-fpm-alpine3.14",
        "${REGISTRY}${REPO}:7.3.33-fpm-alpine3.14",
    ]
}

target "7.3-fpm-alpine3.14" {
    inherits = ["7.3.33-fpm-alpine3.14"]
}

target "7.3.33-nginx-alpine3.14" {
    context = "./7.3/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.3-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.3-nginx-alpine3.14",
        "${REGISTRY}${REPO}:7.3.33-nginx-alpine3.14",
    ]
}

target "7.3-nginx-alpine3.14" {
    inherits = ["7.3.33-nginx-alpine3.14"]
}
