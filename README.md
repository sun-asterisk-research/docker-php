# PHP Docker Image

PHP images based on the [official image](https://hub.docker.com/_/php/) with support for PostgreSQL, MySQL, some common extensions & configurable via environment variables.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/viblo/php.svg)](https://hub.docker.com/r/viblo/php/)

## Available tags

These are all available tags divided into six [variants](#image-variants).

| Docker Tag                                                                                           | Size                                                                                                                                             |
|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| [`latest`, `7.3`, `cli`, `alpine`, `7.3-cli`, `cli-alpine`, `7.3-cli-alpine`](alpine/cli/Dockerfile) | [![image size](https://images.microbadger.com/badges/image/viblo/php:cli.svg)](https://microbadger.com/images/viblo/php:cli)                     |
| [`fpm`, `7.3-fpm`, `fpm-alpine`, `7.3-fpm-alpine`](alpine/fpm/Dockerfile)                            | [![image size](https://images.microbadger.com/badges/image/viblo/php:fpm.svg)](https://microbadger.com/images/viblo/php:fpm)                     |
| [`caddy`, `7.3-caddy`, `caddy-alpine`, `7.3-caddy-alpine`](alpine/caddy/Dockerfile)                  | [![image size](https://images.microbadger.com/badges/image/viblo/php:caddy.svg)](https://microbadger.com/images/viblo/php:caddy)                 |
| [`stretch`, `7.3-stretch`, `cli-stretch`, `7.3-cli-stretch`](stretch/cli/Dockerfile)                 | [![image size](https://images.microbadger.com/badges/image/viblo/php:stretch.svg)](https://microbadger.com/images/viblo/php:stretch)             |
| [`fpm-stretch`, `7.3-fpm-stretch`](stretch/fpm/Dockerfile)                                           | [![image size](https://images.microbadger.com/badges/image/viblo/php:fpm-stretch.svg)](https://microbadger.com/images/viblo/php:fpm-stretch)     |
| [`caddy-stretch`, `7.3-caddy-stretch`](stretch/caddy/Dockerfile)                                     | [![image size](https://images.microbadger.com/badges/image/viblo/php:caddy-stretch.svg)](https://microbadger.com/images/viblo/php:caddy-stretch) |

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

You may install more extensions following the [same method used with the official PHP image](https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions).

## Configuration

Configuration via environment variables is supported.
Environment variables prefixed with `PHP.` are set as PHP configurations.
Environment variables prefixed with `PHP_FPM.` are set as configuration for the `www` pool (fpm and Caddy variants only). For example:

```sh
docker run --rm -it \
    -e PHP.memory_limit=256M \
    -e PHP.post_max_size=64M \
    -e PHP.upload_max_file_size=64M \
    viblo/php
```

```sh
docker run --rm -it \
    -e PHP.memory_limit=256M \
    -e PHP_FPM.pm=ondemand \
    -e PHP_FPM.pm.max_children=40 \
    viblo/php:fpm
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
    viblo/php:fpm
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

There are 3 variants (`PHP CLI`, `PHP-FPM`, `Caddy`) based on *Alpine* and *Debian Stretch* to fit your specific use cases.
Default base is Alpine for minimal image size. You can use the Debian variant if you need support for *glibc* dependent packages/extensions.

Docker tags follow the pattern `viblo/php:<version>-<variant>-<base>`.
`<variant>` is either `cli`, `fpm`, or `caddy`.
`<base>` is either `alpine` or `stretch` (current Debian suite).
Omiting `<version>` or `<base>` will make them the default values (*PHP 7.3* on *Alpine*).

### Caddy

The Caddy variant contains the [Caddy HTTP server](https://caddyserver.com/) to serve the application with php-fpm.
Refer to the [Caddy image](https://hub.docker.com/r/abiosoft/caddy/) for detailed usage.
