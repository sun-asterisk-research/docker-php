# PHP Docker Image

PHP images based on the [official image](https://hub.docker.com/_/php/) with support for PostgreSQL, MySQL, some common extensions & configurable via environment variables.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sunasteriskrnd/php?style=flat-square)](https://hub.docker.com/r/sunasteriskrnd/php/)

## Available tags

These are all available tags divided into six [variants](#image-variants).

| PHP | Tag                                                                                                                    |
|-----|------------------------------------------------------------------------------------------------------------------------|
| 7.4 | [`latest`, `cli`, `alpine`, `cli-alpine`, `7.4`, `7.4-cli`, `7.4-alpine`, `7.4-cli-alpine`](7.4/alpine/cli/Dockerfile) |
|     | [`fpm`, `fpm-alpine`, `7.4-fpm`, `7.4-fpm-alpine`](7.4/alpine/fpm/Dockerfile)                                          |
|     | [`nginx`, `nginx-alpine`, `7.4-nginx`, `7.4-nginx-alpine`](7.4/alpine/nginx/Dockerfile)                                |
|     | [`buster`, `7.4-buster`, `cli-buster`, `7.4-cli-buster`](7.4/buster/cli/Dockerfile)                                    |
|     | [`fpm-buster`, `7.4-fpm-buster`](7.4/buster/fpm/Dockerfile)                                                            |
|     | [`nginx-buster`, `7.4-nginx-buster`](7.4/buster/nginx/Dockerfile)                                                      |
| 7.3 | [`7.3`, `7.3-cli`, `7.3-alpine`, `7.3-cli-alpine`](7.3/alpine/cli/Dockerfile)                                          |
|     | [`7.3-fpm`, `7.3-fpm-alpine`](7.3/alpine/fpm/Dockerfile)                                                               |
|     | [`7.3-nginx`, `7.3-nginx-alpine`](7.3/alpine/nginx/Dockerfile)                                                         |
|     | [`7.3-buster`, `7.3-cli-buster`](7.3/buster/cli/Dockerfile)                                                            |
|     | [`7.3-fpm-buster`](7.3/buster/fpm/Dockerfile)                                                                          |
|     | [`7.3-nginx-buster`](7.3/buster/nginx/Dockerfile)

## Installed extensions

The following extra PHP extensions are installed.

- bcmath
- gd (with JPEG support)
- mysqli
- opcache
- pdo_mysql
- pgsql
- pdo_pgsql
- redis
- zip

You may install more extensions using the [same method used with the official PHP image](https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions).

## Configuration

Configuration via environment variables is supported.
Environment variables prefixed with `PHP.` are set as PHP configurations.
Environment variables prefixed with `PHP_FPM.` are set as configuration for the `www` pool (fpm and nginx variants only).
For example:

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

There are 3 variants (`PHP CLI`, `PHP-FPM`, `Nginx`) based on *Alpine* and *Debian buster* to fit your specific use cases.
Default images are based on [Alpine](https://github.com/docker-library/docs/tree/master/php#phpversion-alpine) for minimal image size.
You can use the Debian variant if you need support for *glibc* dependent packages/extensions.

Docker tags follow the pattern `sunasteriskrnd/php:<version>-<variant>-<base>`.
`<variant>` is either `cli`, `fpm`, or `nginx`.
`<base>` is either `alpine` or `buster` (current Debian suite).
Omiting `<version>` or `<base>` will make them the default values (*PHP 7.4* on *Alpine*).

### `sunasteriskrnd/php:<version>-cli`

PHP CLI image, based on [php:\<version\>-cli](https://github.com/docker-library/docs/tree/master/php#phpversion-cli) image.

### `sunasteriskrnd/php:<version>-fpm`

PHP CLI image, based on [php:\<version\>-fpm](https://github.com/docker-library/docs/tree/master/php#phpversion-cli) image.

### `sunasteriskrnd/php:<version>-nginx`

This image contains the Nginx webserver to serve your PHP application.

#### Usage

Assuming you are in the directory containing your `index.php` file.
Run this command to create a container to serve your application on port 80.

```sh
docker run -d -p 80:80 -v "$PWD":/var/www/html sunasteriskrnd/php:7.4-nginx
```

#### Using a `Dockerfile`

Assuming `src/` is the directory containing your PHP code with an `index.php` file.
You can use the nginx variant as base image for your image as below.

```dockerfile
FROM sunasteriskrnd/php:7.4-nginx

COPY src/ /var/www/html/
```

#### Changing default nginx `root`

By default, the nginx image serves from `/var/www/html` directory.
If you wish to change this location, specify the `DOCUMENT_ROOT` environment variable.
For example, to change the root to `/srv/application`, your Dockerfile may look like this:

```dockerfile
FROM sunasteriskrnd/php:7.4-nginx

ENV DOCUMENT_ROOT=/srv/application

COPY src/ /srv/application
```
