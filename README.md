# PHP Docker Image

PHP images based on the [official PHP image](https://hub.docker.com/_/php/), ready to use for modern web app and easily configurable via environment variables.

[![GitHub CI build status](https://github.com/sun-asterisk-research/docker-php/actions/workflows/ci.yml/badge.svg)](https://github.com/sun-asterisk-research/docker-php/actions/workflows/ci.yml)

## Image variants

Image tags follow the same pattern as the [official image](https://github.com/docker-library/docs/tree/master/php#image-variants).

There are 3 variants (`PHP CLI`, `PHP-FPM`, `Nginx`) based on *Alpine* and *Debian* to fit your specific use cases.

### `sunasteriskrnd/php:<version>-cli`

This variant contains only the PHP CLI tool. Useful when you only need to run PHP code and not serving a web app.
Example use cases are running cronjob commands or a background job worker.

### `sunasteriskrnd/php:<version>-fpm`

This variant contains PHP-FPM. You will need a web server that support FastCGI protocol to server the web app.
Use this variant if you've already had a web server running and want to scale only the PHP-FPM process.

#### PHP-FPM Healthcheck

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

### `sunasteriskrnd/php:<version>-nginx`

This variant is based on the `fpm` variant and comes with NGINX webserver to serve your PHP application.

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

### `sunasteriskrnd/php:<version>-<base>`

Images are either based on *Alpine* or *Debian*. Supported versions are Alpine 3.14 and 3.15, Debian buster and bullseye.

For example, `8.1-cli-bullseye` contains PHP 8.1 CLI based on Debian bullseye.

### Tag aliases

All variants have some tag aliases beside the full tag in the format `<version>-<variant>-<base>`.
Any component in the format can be omited and the default value for it will be used.
Major, minor or patch version can be used for `<version>`.

For example, `8.1-cli-bullseye`, `8.1-cli`, `8.1`, `8`, `cli` all refers to the same image.
See the [docker-bake.hcl](./docker-bake.hcl) file for all tags available.

Currently, the default is *PHP 8.1* CLI variant on *Debian bullseye*.

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
