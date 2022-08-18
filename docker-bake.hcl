# NOTE: This file was generated via generate.sh. Don't edit it directly

variable "REGISTRY" {
    default = "docker.io"
}

variable "REPO" {
    default = "sunasteriskrnd/php"
}

group "default" {
    targets = [
        "8.1.9-cli-bullseye",
        "8.1.9-fpm-bullseye",
        "8.1.9-nginx-bullseye",
        "8.1.9-cli-buster",
        "8.1.9-fpm-buster",
        "8.1.9-nginx-buster",
        "8.1.9-cli-alpine3.16",
        "8.1.9-fpm-alpine3.16",
        "8.1.9-nginx-alpine3.16",
        "8.1.9-cli-alpine3.15",
        "8.1.9-fpm-alpine3.15",
        "8.1.9-nginx-alpine3.15",
        "8.0.22-cli-bullseye",
        "8.0.22-fpm-bullseye",
        "8.0.22-nginx-bullseye",
        "8.0.22-cli-buster",
        "8.0.22-fpm-buster",
        "8.0.22-nginx-buster",
        "8.0.22-cli-alpine3.16",
        "8.0.22-fpm-alpine3.16",
        "8.0.22-nginx-alpine3.16",
        "8.0.22-cli-alpine3.15",
        "8.0.22-fpm-alpine3.15",
        "8.0.22-nginx-alpine3.15",
        "7.4.30-cli-bullseye",
        "7.4.30-fpm-bullseye",
        "7.4.30-nginx-bullseye",
        "7.4.30-cli-buster",
        "7.4.30-fpm-buster",
        "7.4.30-nginx-buster",
        "7.4.30-cli-alpine3.16",
        "7.4.30-fpm-alpine3.16",
        "7.4.30-nginx-alpine3.16",
        "7.4.30-cli-alpine3.15",
        "7.4.30-fpm-alpine3.15",
        "7.4.30-nginx-alpine3.15",
    ]
}

target "8.1.9-cli-bullseye" {
    context = "./8.1/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-bullseye",
        "${REGISTRY}/${REPO}:8-cli",
        "${REGISTRY}/${REPO}:8-bullseye",
        "${REGISTRY}/${REPO}:8",
        "${REGISTRY}/${REPO}:8.1-cli-bullseye",
        "${REGISTRY}/${REPO}:8.1-cli",
        "${REGISTRY}/${REPO}:8.1-bullseye",
        "${REGISTRY}/${REPO}:8.1",
        "${REGISTRY}/${REPO}:8.1.9-cli-bullseye",
        "${REGISTRY}/${REPO}:8.1.9-cli",
        "${REGISTRY}/${REPO}:8.1.9-bullseye",
        "${REGISTRY}/${REPO}:8.1.9",
        "${REGISTRY}/${REPO}:cli-bullseye",
        "${REGISTRY}/${REPO}:cli",
        "${REGISTRY}/${REPO}:bullseye",
        "${REGISTRY}/${REPO}:latest",
    ]
}

target "8.1-cli-bullseye" {
    inherits = ["8.1.9-cli-bullseye"]
}

target "8.1.9-fpm-bullseye" {
    context = "./8.1/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-bullseye",
        "${REGISTRY}/${REPO}:8-fpm",
        "${REGISTRY}/${REPO}:8.1-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.1-fpm",
        "${REGISTRY}/${REPO}:8.1.9-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.1.9-fpm",
        "${REGISTRY}/${REPO}:fpm-bullseye",
        "${REGISTRY}/${REPO}:fpm",
    ]
}

target "8.1-fpm-bullseye" {
    inherits = ["8.1.9-fpm-bullseye"]
}

target "8.1.9-nginx-bullseye" {
    context = "./8.1/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-bullseye",
        "${REGISTRY}/${REPO}:8-nginx",
        "${REGISTRY}/${REPO}:8.1-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.1-nginx",
        "${REGISTRY}/${REPO}:8.1.9-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.1.9-nginx",
        "${REGISTRY}/${REPO}:nginx-bullseye",
        "${REGISTRY}/${REPO}:nginx",
    ]
}

target "8.1-nginx-bullseye" {
    inherits = ["8.1.9-nginx-bullseye"]
}

target "8.1.9-cli-buster" {
    context = "./8.1/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-buster",
        "${REGISTRY}/${REPO}:8-buster",
        "${REGISTRY}/${REPO}:8.1-cli-buster",
        "${REGISTRY}/${REPO}:8.1-buster",
        "${REGISTRY}/${REPO}:8.1.9-cli-buster",
        "${REGISTRY}/${REPO}:8.1.9-buster",
        "${REGISTRY}/${REPO}:cli-buster",
        "${REGISTRY}/${REPO}:buster",
    ]
}

target "8.1-cli-buster" {
    inherits = ["8.1.9-cli-buster"]
}

target "8.1.9-fpm-buster" {
    context = "./8.1/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-buster",
        "${REGISTRY}/${REPO}:8.1-fpm-buster",
        "${REGISTRY}/${REPO}:8.1.9-fpm-buster",
        "${REGISTRY}/${REPO}:fpm-buster",
    ]
}

target "8.1-fpm-buster" {
    inherits = ["8.1.9-fpm-buster"]
}

target "8.1.9-nginx-buster" {
    context = "./8.1/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-buster",
        "${REGISTRY}/${REPO}:8.1-nginx-buster",
        "${REGISTRY}/${REPO}:8.1.9-nginx-buster",
        "${REGISTRY}/${REPO}:nginx-buster",
    ]
}

target "8.1-nginx-buster" {
    inherits = ["8.1.9-nginx-buster"]
}

target "8.1.9-cli-alpine3.16" {
    context = "./8.1/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8-cli-alpine",
        "${REGISTRY}/${REPO}:8-alpine3.16",
        "${REGISTRY}/${REPO}:8-alpine",
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.1-cli-alpine",
        "${REGISTRY}/${REPO}:8.1-alpine3.16",
        "${REGISTRY}/${REPO}:8.1-alpine",
        "${REGISTRY}/${REPO}:8.1.9-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.9-cli-alpine",
        "${REGISTRY}/${REPO}:8.1.9-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.9-alpine",
        "${REGISTRY}/${REPO}:cli-alpine3.16",
        "${REGISTRY}/${REPO}:cli-alpine",
        "${REGISTRY}/${REPO}:alpine3.16",
        "${REGISTRY}/${REPO}:alpine",
    ]
}

target "8.1-cli-alpine3.16" {
    inherits = ["8.1.9-cli-alpine3.16"]
}

target "8.1.9-fpm-alpine3.16" {
    context = "./8.1/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8-fpm-alpine",
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.1-fpm-alpine",
        "${REGISTRY}/${REPO}:8.1.9-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.9-fpm-alpine",
        "${REGISTRY}/${REPO}:fpm-alpine3.16",
        "${REGISTRY}/${REPO}:fpm-alpine",
    ]
}

target "8.1-fpm-alpine3.16" {
    inherits = ["8.1.9-fpm-alpine3.16"]
}

target "8.1.9-nginx-alpine3.16" {
    context = "./8.1/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8-nginx-alpine",
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.1-nginx-alpine",
        "${REGISTRY}/${REPO}:8.1.9-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.1.9-nginx-alpine",
        "${REGISTRY}/${REPO}:nginx-alpine3.16",
        "${REGISTRY}/${REPO}:nginx-alpine",
    ]
}

target "8.1-nginx-alpine3.16" {
    inherits = ["8.1.9-nginx-alpine3.16"]
}

target "8.1.9-cli-alpine3.15" {
    context = "./8.1/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-cli-alpine3.15",
        "${REGISTRY}/${REPO}:8-alpine3.15",
        "${REGISTRY}/${REPO}:8.1-cli-alpine3.15",
        "${REGISTRY}/${REPO}:8.1-alpine3.15",
        "${REGISTRY}/${REPO}:8.1.9-cli-alpine3.15",
        "${REGISTRY}/${REPO}:8.1.9-alpine3.15",
        "${REGISTRY}/${REPO}:cli-alpine3.15",
        "${REGISTRY}/${REPO}:alpine3.15",
    ]
}

target "8.1-cli-alpine3.15" {
    inherits = ["8.1.9-cli-alpine3.15"]
}

target "8.1.9-fpm-alpine3.15" {
    context = "./8.1/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:8.1-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:8.1.9-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:fpm-alpine3.15",
    ]
}

target "8.1-fpm-alpine3.15" {
    inherits = ["8.1.9-fpm-alpine3.15"]
}

target "8.1.9-nginx-alpine3.15" {
    context = "./8.1/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:8.1-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:8.1.9-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:nginx-alpine3.15",
    ]
}

target "8.1-nginx-alpine3.15" {
    inherits = ["8.1.9-nginx-alpine3.15"]
}

target "8.0.22-cli-bullseye" {
    context = "./8.0/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0-cli",
        "${REGISTRY}/${REPO}:8.0-bullseye",
        "${REGISTRY}/${REPO}:8.0",
        "${REGISTRY}/${REPO}:8.0.22-cli-bullseye",
        "${REGISTRY}/${REPO}:8.0.22-cli",
        "${REGISTRY}/${REPO}:8.0.22-bullseye",
        "${REGISTRY}/${REPO}:8.0.22",
    ]
}

target "8.0-cli-bullseye" {
    inherits = ["8.0.22-cli-bullseye"]
}

target "8.0.22-fpm-bullseye" {
    context = "./8.0/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0-fpm",
        "${REGISTRY}/${REPO}:8.0.22-fpm-bullseye",
        "${REGISTRY}/${REPO}:8.0.22-fpm",
    ]
}

target "8.0-fpm-bullseye" {
    inherits = ["8.0.22-fpm-bullseye"]
}

target "8.0.22-nginx-bullseye" {
    context = "./8.0/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0-nginx",
        "${REGISTRY}/${REPO}:8.0.22-nginx-bullseye",
        "${REGISTRY}/${REPO}:8.0.22-nginx",
    ]
}

target "8.0-nginx-bullseye" {
    inherits = ["8.0.22-nginx-bullseye"]
}

target "8.0.22-cli-buster" {
    context = "./8.0/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-buster",
        "${REGISTRY}/${REPO}:8.0-buster",
        "${REGISTRY}/${REPO}:8.0.22-cli-buster",
        "${REGISTRY}/${REPO}:8.0.22-buster",
    ]
}

target "8.0-cli-buster" {
    inherits = ["8.0.22-cli-buster"]
}

target "8.0.22-fpm-buster" {
    context = "./8.0/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-buster",
        "${REGISTRY}/${REPO}:8.0.22-fpm-buster",
    ]
}

target "8.0-fpm-buster" {
    inherits = ["8.0.22-fpm-buster"]
}

target "8.0.22-nginx-buster" {
    context = "./8.0/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-buster",
        "${REGISTRY}/${REPO}:8.0.22-nginx-buster",
    ]
}

target "8.0-nginx-buster" {
    inherits = ["8.0.22-nginx-buster"]
}

target "8.0.22-cli-alpine3.16" {
    context = "./8.0/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-cli-alpine",
        "${REGISTRY}/${REPO}:8.0-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-alpine",
        "${REGISTRY}/${REPO}:8.0.22-cli-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.22-cli-alpine",
        "${REGISTRY}/${REPO}:8.0.22-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.22-alpine",
    ]
}

target "8.0-cli-alpine3.16" {
    inherits = ["8.0.22-cli-alpine3.16"]
}

target "8.0.22-fpm-alpine3.16" {
    context = "./8.0/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-fpm-alpine",
        "${REGISTRY}/${REPO}:8.0.22-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.22-fpm-alpine",
    ]
}

target "8.0-fpm-alpine3.16" {
    inherits = ["8.0.22-fpm-alpine3.16"]
}

target "8.0.22-nginx-alpine3.16" {
    context = "./8.0/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0-nginx-alpine",
        "${REGISTRY}/${REPO}:8.0.22-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:8.0.22-nginx-alpine",
    ]
}

target "8.0-nginx-alpine3.16" {
    inherits = ["8.0.22-nginx-alpine3.16"]
}

target "8.0.22-cli-alpine3.15" {
    context = "./8.0/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-cli-alpine3.15",
        "${REGISTRY}/${REPO}:8.0-alpine3.15",
        "${REGISTRY}/${REPO}:8.0.22-cli-alpine3.15",
        "${REGISTRY}/${REPO}:8.0.22-alpine3.15",
    ]
}

target "8.0-cli-alpine3.15" {
    inherits = ["8.0.22-cli-alpine3.15"]
}

target "8.0.22-fpm-alpine3.15" {
    context = "./8.0/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:8.0.22-fpm-alpine3.15",
    ]
}

target "8.0-fpm-alpine3.15" {
    inherits = ["8.0.22-fpm-alpine3.15"]
}

target "8.0.22-nginx-alpine3.15" {
    context = "./8.0/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:8.0-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:8.0.22-nginx-alpine3.15",
    ]
}

target "8.0-nginx-alpine3.15" {
    inherits = ["8.0.22-nginx-alpine3.15"]
}

target "7.4.30-cli-bullseye" {
    context = "./7.4/bullseye/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-cli-bullseye",
        "${REGISTRY}/${REPO}:7-cli",
        "${REGISTRY}/${REPO}:7-bullseye",
        "${REGISTRY}/${REPO}:7",
        "${REGISTRY}/${REPO}:7.4-cli-bullseye",
        "${REGISTRY}/${REPO}:7.4-cli",
        "${REGISTRY}/${REPO}:7.4-bullseye",
        "${REGISTRY}/${REPO}:7.4",
        "${REGISTRY}/${REPO}:7.4.30-cli-bullseye",
        "${REGISTRY}/${REPO}:7.4.30-cli",
        "${REGISTRY}/${REPO}:7.4.30-bullseye",
        "${REGISTRY}/${REPO}:7.4.30",
    ]
}

target "7.4-cli-bullseye" {
    inherits = ["7.4.30-cli-bullseye"]
}

target "7.4.30-fpm-bullseye" {
    context = "./7.4/bullseye/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-fpm-bullseye",
        "${REGISTRY}/${REPO}:7-fpm",
        "${REGISTRY}/${REPO}:7.4-fpm-bullseye",
        "${REGISTRY}/${REPO}:7.4-fpm",
        "${REGISTRY}/${REPO}:7.4.30-fpm-bullseye",
        "${REGISTRY}/${REPO}:7.4.30-fpm",
    ]
}

target "7.4-fpm-bullseye" {
    inherits = ["7.4.30-fpm-bullseye"]
}

target "7.4.30-nginx-bullseye" {
    context = "./7.4/bullseye/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-nginx-bullseye",
        "${REGISTRY}/${REPO}:7-nginx",
        "${REGISTRY}/${REPO}:7.4-nginx-bullseye",
        "${REGISTRY}/${REPO}:7.4-nginx",
        "${REGISTRY}/${REPO}:7.4.30-nginx-bullseye",
        "${REGISTRY}/${REPO}:7.4.30-nginx",
    ]
}

target "7.4-nginx-bullseye" {
    inherits = ["7.4.30-nginx-bullseye"]
}

target "7.4.30-cli-buster" {
    context = "./7.4/buster/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-cli-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-cli-buster",
        "${REGISTRY}/${REPO}:7-buster",
        "${REGISTRY}/${REPO}:7.4-cli-buster",
        "${REGISTRY}/${REPO}:7.4-buster",
        "${REGISTRY}/${REPO}:7.4.30-cli-buster",
        "${REGISTRY}/${REPO}:7.4.30-buster",
    ]
}

target "7.4-cli-buster" {
    inherits = ["7.4.30-cli-buster"]
}

target "7.4.30-fpm-buster" {
    context = "./7.4/buster/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-fpm-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-fpm-buster",
        "${REGISTRY}/${REPO}:7.4-fpm-buster",
        "${REGISTRY}/${REPO}:7.4.30-fpm-buster",
    ]
}

target "7.4-fpm-buster" {
    inherits = ["7.4.30-fpm-buster"]
}

target "7.4.30-nginx-buster" {
    context = "./7.4/buster/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-nginx-buster"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-nginx-buster",
        "${REGISTRY}/${REPO}:7.4-nginx-buster",
        "${REGISTRY}/${REPO}:7.4.30-nginx-buster",
    ]
}

target "7.4-nginx-buster" {
    inherits = ["7.4.30-nginx-buster"]
}

target "7.4.30-cli-alpine3.16" {
    context = "./7.4/alpine3.16/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-cli-alpine3.16",
        "${REGISTRY}/${REPO}:7-cli-alpine",
        "${REGISTRY}/${REPO}:7-alpine3.16",
        "${REGISTRY}/${REPO}:7-alpine",
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-cli-alpine",
        "${REGISTRY}/${REPO}:7.4-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-alpine",
        "${REGISTRY}/${REPO}:7.4.30-cli-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.30-cli-alpine",
        "${REGISTRY}/${REPO}:7.4.30-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.30-alpine",
    ]
}

target "7.4-cli-alpine3.16" {
    inherits = ["7.4.30-cli-alpine3.16"]
}

target "7.4.30-fpm-alpine3.16" {
    context = "./7.4/alpine3.16/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:7-fpm-alpine",
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-fpm-alpine",
        "${REGISTRY}/${REPO}:7.4.30-fpm-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.30-fpm-alpine",
    ]
}

target "7.4-fpm-alpine3.16" {
    inherits = ["7.4.30-fpm-alpine3.16"]
}

target "7.4.30-nginx-alpine3.16" {
    context = "./7.4/alpine3.16/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.16"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:7-nginx-alpine",
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:7.4-nginx-alpine",
        "${REGISTRY}/${REPO}:7.4.30-nginx-alpine3.16",
        "${REGISTRY}/${REPO}:7.4.30-nginx-alpine",
    ]
}

target "7.4-nginx-alpine3.16" {
    inherits = ["7.4.30-nginx-alpine3.16"]
}

target "7.4.30-cli-alpine3.15" {
    context = "./7.4/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-cli-alpine3.15",
        "${REGISTRY}/${REPO}:7-alpine3.15",
        "${REGISTRY}/${REPO}:7.4-cli-alpine3.15",
        "${REGISTRY}/${REPO}:7.4-alpine3.15",
        "${REGISTRY}/${REPO}:7.4.30-cli-alpine3.15",
        "${REGISTRY}/${REPO}:7.4.30-alpine3.15",
    ]
}

target "7.4-cli-alpine3.15" {
    inherits = ["7.4.30-cli-alpine3.15"]
}

target "7.4.30-fpm-alpine3.15" {
    context = "./7.4/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:7.4-fpm-alpine3.15",
        "${REGISTRY}/${REPO}:7.4.30-fpm-alpine3.15",
    ]
}

target "7.4-fpm-alpine3.15" {
    inherits = ["7.4.30-fpm-alpine3.15"]
}

target "7.4.30-nginx-alpine3.15" {
    context = "./7.4/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}/${REPO}:7-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:7.4-nginx-alpine3.15",
        "${REGISTRY}/${REPO}:7.4.30-nginx-alpine3.15",
    ]
}

target "7.4-nginx-alpine3.15" {
    inherits = ["7.4.30-nginx-alpine3.15"]
}
