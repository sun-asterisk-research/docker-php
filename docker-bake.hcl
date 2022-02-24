variable "REGISTRY" {
    default = ""
}

variable "REPO" {
    default = "sunasteriskrnd/php"
}

group "default" {
    targets = [
        "7.3.33-cli-buster",
        "7.3.33-fpm-buster",
        "7.3.33-nginx-buster",
        "7.3.33-cli-bullseye",
        "7.3.33-fpm-bullseye",
        "7.3.33-nginx-bullseye",
        "7.3.33-cli-alpine3.14",
        "7.3.33-fpm-alpine3.14",
        "7.3.33-nginx-alpine3.14",
        "7.3.33-cli-alpine3.15",
        "7.3.33-fpm-alpine3.15",
        "7.3.33-nginx-alpine3.15",
        "7.4.28-cli-buster",
        "7.4.28-fpm-buster",
        "7.4.28-nginx-buster",
        "7.4.28-cli-bullseye",
        "7.4.28-fpm-bullseye",
        "7.4.28-nginx-bullseye",
        "7.4.28-cli-alpine3.14",
        "7.4.28-fpm-alpine3.14",
        "7.4.28-nginx-alpine3.14",
        "7.4.28-cli-alpine3.15",
        "7.4.28-fpm-alpine3.15",
        "7.4.28-nginx-alpine3.15",
        "8.0.16-cli-buster",
        "8.0.16-fpm-buster",
        "8.0.16-nginx-buster",
        "8.0.16-cli-bullseye",
        "8.0.16-fpm-bullseye",
        "8.0.16-nginx-bullseye",
        "8.0.16-cli-alpine3.14",
        "8.0.16-fpm-alpine3.14",
        "8.0.16-nginx-alpine3.14",
        "8.0.16-cli-alpine3.15",
        "8.0.16-fpm-alpine3.15",
        "8.0.16-nginx-alpine3.15",
        "8.1.3-cli-buster",
        "8.1.3-fpm-buster",
        "8.1.3-nginx-buster",
        "8.1.3-cli-bullseye",
        "8.1.3-fpm-bullseye",
        "8.1.3-nginx-bullseye",
        "8.1.3-cli-alpine3.14",
        "8.1.3-fpm-alpine3.14",
        "8.1.3-nginx-alpine3.14",
        "8.1.3-cli-alpine3.15",
        "8.1.3-fpm-alpine3.15",
        "8.1.3-nginx-alpine3.15",
    ]
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

target "7.4.28-cli-buster" {
    context = "./7.4/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-cli-buster",
        "${REGISTRY}${REPO}:7.4-buster",
        "${REGISTRY}${REPO}:7.4.28-cli-buster",
        "${REGISTRY}${REPO}:7.4.28-buster",
    ]
}

target "7.4-cli-buster" {
    inherits = ["7.4.28-cli-buster"]
}

target "7.4.28-fpm-buster" {
    context = "./7.4/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-fpm-buster",
        "${REGISTRY}${REPO}:7.4.28-fpm-buster",
    ]
}

target "7.4-fpm-buster" {
    inherits = ["7.4.28-fpm-buster"]
}

target "7.4.28-nginx-buster" {
    context = "./7.4/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-nginx-buster",
        "${REGISTRY}${REPO}:7.4.28-nginx-buster",
    ]
}

target "7.4-nginx-buster" {
    inherits = ["7.4.28-nginx-buster"]
}

target "7.4.28-cli-bullseye" {
    context = "./7.4/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-cli-bullseye",
        "${REGISTRY}${REPO}:7.4-cli",
        "${REGISTRY}${REPO}:7.4-bullseye",
        "${REGISTRY}${REPO}:7.4",
        "${REGISTRY}${REPO}:7.4.28-cli-bullseye",
        "${REGISTRY}${REPO}:7.4.28-cli",
        "${REGISTRY}${REPO}:7.4.28-bullseye",
        "${REGISTRY}${REPO}:7.4.28",
    ]
}

target "7.4-cli-bullseye" {
    inherits = ["7.4.28-cli-bullseye"]
}

target "7.4.28-fpm-bullseye" {
    context = "./7.4/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-fpm-bullseye",
        "${REGISTRY}${REPO}:7.4-fpm",
        "${REGISTRY}${REPO}:7.4.28-fpm-bullseye",
        "${REGISTRY}${REPO}:7.4.28-fpm",
    ]
}

target "7.4-fpm-bullseye" {
    inherits = ["7.4.28-fpm-bullseye"]
}

target "7.4.28-nginx-bullseye" {
    context = "./7.4/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-nginx-bullseye",
        "${REGISTRY}${REPO}:7.4-nginx",
        "${REGISTRY}${REPO}:7.4.28-nginx-bullseye",
        "${REGISTRY}${REPO}:7.4.28-nginx",
    ]
}

target "7.4-nginx-bullseye" {
    inherits = ["7.4.28-nginx-bullseye"]
}

target "7.4.28-cli-alpine3.14" {
    context = "./7.4/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.4-alpine3.14",
        "${REGISTRY}${REPO}:7.4.28-cli-alpine3.14",
        "${REGISTRY}${REPO}:7.4.28-alpine3.14",
    ]
}

target "7.4-cli-alpine3.14" {
    inherits = ["7.4.28-cli-alpine3.14"]
}

target "7.4.28-fpm-alpine3.14" {
    context = "./7.4/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.14",
        "${REGISTRY}${REPO}:7.4.28-fpm-alpine3.14",
    ]
}

target "7.4-fpm-alpine3.14" {
    inherits = ["7.4.28-fpm-alpine3.14"]
}

target "7.4.28-nginx-alpine3.14" {
    context = "./7.4/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.14",
        "${REGISTRY}${REPO}:7.4.28-nginx-alpine3.14",
    ]
}

target "7.4-nginx-alpine3.14" {
    inherits = ["7.4.28-nginx-alpine3.14"]
}

target "7.4.28-cli-alpine3.15" {
    context = "./7.4/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.4-cli-alpine",
        "${REGISTRY}${REPO}:7.4-alpine3.15",
        "${REGISTRY}${REPO}:7.4-alpine",
        "${REGISTRY}${REPO}:7.4.28-cli-alpine3.15",
        "${REGISTRY}${REPO}:7.4.28-cli-alpine",
        "${REGISTRY}${REPO}:7.4.28-alpine3.15",
        "${REGISTRY}${REPO}:7.4.28-alpine",
    ]
}

target "7.4-cli-alpine3.15" {
    inherits = ["7.4.28-cli-alpine3.15"]
}

target "7.4.28-fpm-alpine3.15" {
    context = "./7.4/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.4-fpm-alpine",
        "${REGISTRY}${REPO}:7.4.28-fpm-alpine3.15",
        "${REGISTRY}${REPO}:7.4.28-fpm-alpine",
    ]
}

target "7.4-fpm-alpine3.15" {
    inherits = ["7.4.28-fpm-alpine3.15"]
}

target "7.4.28-nginx-alpine3.15" {
    context = "./7.4/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:7.4-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.4-nginx-alpine",
        "${REGISTRY}${REPO}:7.4.28-nginx-alpine3.15",
        "${REGISTRY}${REPO}:7.4.28-nginx-alpine",
    ]
}

target "7.4-nginx-alpine3.15" {
    inherits = ["7.4.28-nginx-alpine3.15"]
}

target "8.0.16-cli-buster" {
    context = "./8.0/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-buster",
        "${REGISTRY}${REPO}:8.0-buster",
        "${REGISTRY}${REPO}:8.0.16-cli-buster",
        "${REGISTRY}${REPO}:8.0.16-buster",
    ]
}

target "8.0-cli-buster" {
    inherits = ["8.0.16-cli-buster"]
}

target "8.0.16-fpm-buster" {
    context = "./8.0/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-buster",
        "${REGISTRY}${REPO}:8.0.16-fpm-buster",
    ]
}

target "8.0-fpm-buster" {
    inherits = ["8.0.16-fpm-buster"]
}

target "8.0.16-nginx-buster" {
    context = "./8.0/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-buster",
        "${REGISTRY}${REPO}:8.0.16-nginx-buster",
    ]
}

target "8.0-nginx-buster" {
    inherits = ["8.0.16-nginx-buster"]
}

target "8.0.16-cli-bullseye" {
    context = "./8.0/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-bullseye",
        "${REGISTRY}${REPO}:8.0-cli",
        "${REGISTRY}${REPO}:8.0-bullseye",
        "${REGISTRY}${REPO}:8.0",
        "${REGISTRY}${REPO}:8.0.16-cli-bullseye",
        "${REGISTRY}${REPO}:8.0.16-cli",
        "${REGISTRY}${REPO}:8.0.16-bullseye",
        "${REGISTRY}${REPO}:8.0.16",
    ]
}

target "8.0-cli-bullseye" {
    inherits = ["8.0.16-cli-bullseye"]
}

target "8.0.16-fpm-bullseye" {
    context = "./8.0/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-bullseye",
        "${REGISTRY}${REPO}:8.0-fpm",
        "${REGISTRY}${REPO}:8.0.16-fpm-bullseye",
        "${REGISTRY}${REPO}:8.0.16-fpm",
    ]
}

target "8.0-fpm-bullseye" {
    inherits = ["8.0.16-fpm-bullseye"]
}

target "8.0.16-nginx-bullseye" {
    context = "./8.0/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-bullseye",
        "${REGISTRY}${REPO}:8.0-nginx",
        "${REGISTRY}${REPO}:8.0.16-nginx-bullseye",
        "${REGISTRY}${REPO}:8.0.16-nginx",
    ]
}

target "8.0-nginx-bullseye" {
    inherits = ["8.0.16-nginx-bullseye"]
}

target "8.0.16-cli-alpine3.14" {
    context = "./8.0/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.0-alpine3.14",
        "${REGISTRY}${REPO}:8.0.16-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.0.16-alpine3.14",
    ]
}

target "8.0-cli-alpine3.14" {
    inherits = ["8.0.16-cli-alpine3.14"]
}

target "8.0.16-fpm-alpine3.14" {
    context = "./8.0/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.14",
        "${REGISTRY}${REPO}:8.0.16-fpm-alpine3.14",
    ]
}

target "8.0-fpm-alpine3.14" {
    inherits = ["8.0.16-fpm-alpine3.14"]
}

target "8.0.16-nginx-alpine3.14" {
    context = "./8.0/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.14",
        "${REGISTRY}${REPO}:8.0.16-nginx-alpine3.14",
    ]
}

target "8.0-nginx-alpine3.14" {
    inherits = ["8.0.16-nginx-alpine3.14"]
}

target "8.0.16-cli-alpine3.15" {
    context = "./8.0/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.0-cli-alpine",
        "${REGISTRY}${REPO}:8.0-alpine3.15",
        "${REGISTRY}${REPO}:8.0-alpine",
        "${REGISTRY}${REPO}:8.0.16-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.0.16-cli-alpine",
        "${REGISTRY}${REPO}:8.0.16-alpine3.15",
        "${REGISTRY}${REPO}:8.0.16-alpine",
    ]
}

target "8.0-cli-alpine3.15" {
    inherits = ["8.0.16-cli-alpine3.15"]
}

target "8.0.16-fpm-alpine3.15" {
    context = "./8.0/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.0-fpm-alpine",
        "${REGISTRY}${REPO}:8.0.16-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.0.16-fpm-alpine",
    ]
}

target "8.0-fpm-alpine3.15" {
    inherits = ["8.0.16-fpm-alpine3.15"]
}

target "8.0.16-nginx-alpine3.15" {
    context = "./8.0/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.0-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.0-nginx-alpine",
        "${REGISTRY}${REPO}:8.0.16-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.0.16-nginx-alpine",
    ]
}

target "8.0-nginx-alpine3.15" {
    inherits = ["8.0.16-nginx-alpine3.15"]
}

target "8.1.3-cli-buster" {
    context = "./8.1/buster/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-cli-buster",
        "${REGISTRY}${REPO}:8.1-buster",
        "${REGISTRY}${REPO}:8.1.3-cli-buster",
        "${REGISTRY}${REPO}:8.1.3-buster",
        "${REGISTRY}${REPO}:cli-buster",
        "${REGISTRY}${REPO}:buster",
    ]
}

target "8.1-cli-buster" {
    inherits = ["8.1.3-cli-buster"]
}

target "8.1.3-fpm-buster" {
    context = "./8.1/buster/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-fpm-buster",
        "${REGISTRY}${REPO}:8.1.3-fpm-buster",
        "${REGISTRY}${REPO}:fpm-buster",
    ]
}

target "8.1-fpm-buster" {
    inherits = ["8.1.3-fpm-buster"]
}

target "8.1.3-nginx-buster" {
    context = "./8.1/buster/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-buster"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-nginx-buster",
        "${REGISTRY}${REPO}:8.1.3-nginx-buster",
        "${REGISTRY}${REPO}:nginx-buster",
    ]
}

target "8.1-nginx-buster" {
    inherits = ["8.1.3-nginx-buster"]
}

target "8.1.3-cli-bullseye" {
    context = "./8.1/bullseye/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-cli-bullseye",
        "${REGISTRY}${REPO}:8.1-cli",
        "${REGISTRY}${REPO}:8.1-bullseye",
        "${REGISTRY}${REPO}:8.1",
        "${REGISTRY}${REPO}:8.1.3-cli-bullseye",
        "${REGISTRY}${REPO}:8.1.3-cli",
        "${REGISTRY}${REPO}:8.1.3-bullseye",
        "${REGISTRY}${REPO}:8.1.3",
        "${REGISTRY}${REPO}:cli-bullseye",
        "${REGISTRY}${REPO}:cli",
        "${REGISTRY}${REPO}:bullseye",
        "${REGISTRY}${REPO}:latest",
    ]
}

target "8.1-cli-bullseye" {
    inherits = ["8.1.3-cli-bullseye"]
}

target "8.1.3-fpm-bullseye" {
    context = "./8.1/bullseye/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-fpm-bullseye",
        "${REGISTRY}${REPO}:8.1-fpm",
        "${REGISTRY}${REPO}:8.1.3-fpm-bullseye",
        "${REGISTRY}${REPO}:8.1.3-fpm",
        "${REGISTRY}${REPO}:fpm-bullseye",
        "${REGISTRY}${REPO}:fpm",
    ]
}

target "8.1-fpm-bullseye" {
    inherits = ["8.1.3-fpm-bullseye"]
}

target "8.1.3-nginx-bullseye" {
    context = "./8.1/bullseye/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-bullseye"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-nginx-bullseye",
        "${REGISTRY}${REPO}:8.1-nginx",
        "${REGISTRY}${REPO}:8.1.3-nginx-bullseye",
        "${REGISTRY}${REPO}:8.1.3-nginx",
        "${REGISTRY}${REPO}:nginx-bullseye",
        "${REGISTRY}${REPO}:nginx",
    ]
}

target "8.1-nginx-bullseye" {
    inherits = ["8.1.3-nginx-bullseye"]
}

target "8.1.3-cli-alpine3.14" {
    context = "./8.1/alpine3.14/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.1-alpine3.14",
        "${REGISTRY}${REPO}:8.1.3-cli-alpine3.14",
        "${REGISTRY}${REPO}:8.1.3-alpine3.14",
        "${REGISTRY}${REPO}:cli-alpine3.14",
        "${REGISTRY}${REPO}:alpine3.14",
    ]
}

target "8.1-cli-alpine3.14" {
    inherits = ["8.1.3-cli-alpine3.14"]
}

target "8.1.3-fpm-alpine3.14" {
    context = "./8.1/alpine3.14/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.14",
        "${REGISTRY}${REPO}:8.1.3-fpm-alpine3.14",
        "${REGISTRY}${REPO}:fpm-alpine3.14",
    ]
}

target "8.1-fpm-alpine3.14" {
    inherits = ["8.1.3-fpm-alpine3.14"]
}

target "8.1.3-nginx-alpine3.14" {
    context = "./8.1/alpine3.14/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.14"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.14",
        "${REGISTRY}${REPO}:8.1.3-nginx-alpine3.14",
        "${REGISTRY}${REPO}:nginx-alpine3.14",
    ]
}

target "8.1-nginx-alpine3.14" {
    inherits = ["8.1.3-nginx-alpine3.14"]
}

target "8.1.3-cli-alpine3.15" {
    context = "./8.1/alpine3.15/cli"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.1-cli-alpine",
        "${REGISTRY}${REPO}:8.1-alpine3.15",
        "${REGISTRY}${REPO}:8.1-alpine",
        "${REGISTRY}${REPO}:8.1.3-cli-alpine3.15",
        "${REGISTRY}${REPO}:8.1.3-cli-alpine",
        "${REGISTRY}${REPO}:8.1.3-alpine3.15",
        "${REGISTRY}${REPO}:8.1.3-alpine",
        "${REGISTRY}${REPO}:cli-alpine3.15",
        "${REGISTRY}${REPO}:cli-alpine",
        "${REGISTRY}${REPO}:alpine3.15",
        "${REGISTRY}${REPO}:alpine",
    ]
}

target "8.1-cli-alpine3.15" {
    inherits = ["8.1.3-cli-alpine3.15"]
}

target "8.1.3-fpm-alpine3.15" {
    context = "./8.1/alpine3.15/fpm"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.1-fpm-alpine",
        "${REGISTRY}${REPO}:8.1.3-fpm-alpine3.15",
        "${REGISTRY}${REPO}:8.1.3-fpm-alpine",
        "${REGISTRY}${REPO}:fpm-alpine3.15",
        "${REGISTRY}${REPO}:fpm-alpine",
    ]
}

target "8.1-fpm-alpine3.15" {
    inherits = ["8.1.3-fpm-alpine3.15"]
}

target "8.1.3-nginx-alpine3.15" {
    context = "./8.1/alpine3.15/nginx"
    cache-from = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.15"
    ]
    tags = [
        "${REGISTRY}${REPO}:8.1-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.1-nginx-alpine",
        "${REGISTRY}${REPO}:8.1.3-nginx-alpine3.15",
        "${REGISTRY}${REPO}:8.1.3-nginx-alpine",
        "${REGISTRY}${REPO}:nginx-alpine3.15",
        "${REGISTRY}${REPO}:nginx-alpine",
    ]
}

target "8.1-nginx-alpine3.15" {
    inherits = ["8.1.3-nginx-alpine3.15"]
}
