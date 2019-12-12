# PHP Docker Image

PHP images based on the [official image](https://hub.docker.com/_/php/) with support for PostgreSQL, MySQL, some common extensions & configurable via environment variables.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sunasteriskrnd/php?style=flat-square)](https://hub.docker.com/r/sunasteriskrnd/php/)

## Available tags

These are all available tags divided into six [variants](#image-variants).

| PHP | Tag                                                                                                                    |
|-----|------------------------------------------------------------------------------------------------------------------------|
| 7.4 | [`latest`, `cli`, `alpine`, `cli-alpine`, `7.4`, `7.4-cli`, `7.4-alpine`, `7.4-cli-alpine`](7.4/alpine/cli/Dockerfile) |
|     | [`fpm`, `fpm-alpine`, `7.4-fpm`, `7.4-fpm-alpine`](7.4/alpine/fpm/Dockerfile)                                          |
|     | [`caddy`, `caddy-alpine`, `7.4-caddy`, `7.4-caddy-alpine`](7.4/alpine/caddy/Dockerfile)                                |
|     | [`buster`, `7.4-buster`, `cli-buster`, `7.4-cli-buster`](7.4/buster/cli/Dockerfile)                                    |
|     | [`fpm-buster`, `7.4-fpm-buster`](7.4/buster/fpm/Dockerfile)                                                            |
|     | [`caddy-buster`, `7.4-caddy-buster`](7.4/buster/caddy/Dockerfile)                                                      |
| 7.3 | [`7.3`, `7.3-cli`, `7.3-alpine`, `7.3-cli-alpine`](7.3/alpine/cli/Dockerfile)                                          |
|     | [`7.3-fpm`, `7.3-fpm-alpine`](7.3/alpine/fpm/Dockerfile)                                                               |
|     | [`7.3-caddy`, `7.3-caddy-alpine`](7.3/alpine/caddy/Dockerfile)                                                         |
|     | [`7.3-buster`, `7.3-cli-buster`](7.3/buster/cli/Dockerfile)                                                            |
|     | [`7.3-fpm-buster`](7.3/buster/fpm/Dockerfile)                                                                          |
|     | [`7.3-caddy-buster`](7.3/buster/caddy/Dockerfile)                                                                      |

## Installed extensions

The following extra PHP extensions are installed.

- opcache
- zip
- gd (with JPEG support)
- bcmath
- mysqli
- pdo_mysql
- pgsql
- pdo_pgsql

You may install more extensions using the [same method used with the official PHP image](https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions).

## Configuration

Configuration via environment variables is supported.
Environment variables prefixed with `PHP.` are set as PHP configurations.
Environment variables prefixed with `PHP_FPM.` are set as configuration for the `www` pool (fpm and Caddy variants only). For example:

```sh
docker run --rm -it \
    -e PHP.memory_limit=256M \
    -e PHP.post_max_size=64M \
    -e PHP.upload_max_file_size=64M \
    sunasteriskrnd/php
```

```sh
docker run --rm -it \
    -e PHP.memory_limit=256M \
    -e PHP_FPM.pm=ondemand \
    -e PHP_FPM.pm.max_children=40 \
    sunasteriskrnd/php:fpm
```

Or you can use the [original method](https://github.com/docker-library/docs/tree/master/php#configuration) as used with the official image.

## PHP-FPM Healthcheck

Healthcheck for *php-fpm* image is included as a script `php-fpm-healthcheck`.

```sh
docker run --rm -d  \
    --health-cmd=php-fpm-healthcheck \
    --health-interval=15s \
    --health-timeout=3s \
    --health-retries=3 \
    sunasteriskrnd/php:fpm
```

Using *docker-compose*:

```yml
healthcheck:
  test: ["CMD", "php-fpm-healthcheck"]
  interval: 15s
  timeout: 3s
  retries: 3
```

## Image variants

There are 3 variants (`PHP CLI`, `PHP-FPM`, `Caddy`) based on *Alpine* and *Debian buster* to fit your specific use cases.
Default base is Alpine for minimal image size. You can use the Debian variant if you need support for *glibc* dependent packages/extensions.

Docker tags follow the pattern `sunasteriskrnd/php:<version>-<variant>-<base>`.
`<variant>` is either `cli`, `fpm`, or `caddy`.
`<base>` is either `alpine` or `buster` (current Debian suite).
Omiting `<version>` or `<base>` will make them the default values (*PHP 7.4* on *Alpine*).

### Caddy

The Caddy variant contains the [Caddy HTTP server](https://caddyserver.com/) to serve the application with php-fpm.
Refer to the [Caddy image](https://hub.docker.com/r/abiosoft/caddy/) for detailed usage.
