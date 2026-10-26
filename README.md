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

Images are either based on *Alpine* or *Debian*. Each PHP line is built on these bases:

| PHP | Debian | Alpine |
|---|---|---|
| 8.2 (8.2.35) | trixie, bookworm | alpine3.24, alpine3.23 |
| 8.1 (8.1.34, patched) | bookworm | alpine3.22 |
| 8.0 (8.0.30, patched) | bullseye, buster | alpine3.16 |
| 7.4 (7.4.33, patched) | | alpine3.16 |

For example, `8.1-cli-bookworm` contains PHP 8.1 CLI based on Debian bookworm.

Debian buster and bullseye are end-of-life, so their images point APT at `archive.debian.org`. Package installs in a derived `Dockerfile` keep working, but those packages receive no further security updates.

### Tag aliases

All variants have some tag aliases beside the full tag in the format `<version>-<variant>-<base>`.
Any component in the format can be omited and the default value for it will be used.
Major, minor or patch version can be used for `<version>`.

For example, `8.2-cli-trixie`, `8.2-cli`, `8.2`, `8`, `cli` all refers to the same image.
See the [docker-bake.hcl](./docker-bake.hcl) file for all tags available.

Currently, the default is *PHP 8.2* CLI variant on *Debian trixie*, and `alpine` refers to *PHP 8.2* CLI on *Alpine 3.24*.

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

The Debian images no longer set the `RUN_DEPS` environment variable. The runtime libraries of the installed extensions are now detected automatically, so a `Dockerfile` that references `$RUN_DEPS` must name its packages itself.

## Security

### PHP2Shell (CVE-2026-109618, CVE-2026-109619)

Every image built from this repository runs a PHP fixed for PHP2Shell:

- **8.2** uses the official 8.2.35 release.
- **8.1, 8.0 and 7.4** are end-of-life and have no fixed release. Their images rebuild the official 8.1.34, 8.0.30 and 7.4.33 runtimes with the PHP security team's upstream backports, vendored in [`patches/`](./patches):

  | PHP | php-src commit |
  |---|---|
  | 8.1.34 | `1d7dec178a094e6e75b229ce22754045f8c6070a` |
  | 8.0.30 | `82f8f31b16a035c1b67cc253e79f7cc288f4cc20` |
  | 7.4.33 | `712e60f9edfd03f0960fc4fc3c2c375f42b90aa2` |

  `php -v` still reports the original version. Check the image label and the patch shipped in the image instead:

  ```sh
  docker inspect --format '{{ index .Config.Labels "io.github.sun-asterisk-research.php.patches" }}' sunasteriskrnd/php:8.1
  docker run --rm sunasteriskrnd/php:8.1 ls /usr/local/share/php-patches
  ```

PHP 8.1, 8.0 and 7.4 receive no other security fixes. Migrate to a supported PHP version.

Tags for 8.1 and 8.2 on Debian buster and bullseye and on Alpine 3.16 and 3.17 (for example `8.2-fpm-bullseye` or `8.1-cli-alpine3.17`) are no longer updated and **remain vulnerable**. The same applies to the version-less `cli-alpine3.16`, `fpm-alpine3.16` and `nginx-alpine3.16` tags. Switch to one of the bases listed above.

### Session upload progress (CVE-2026-115560)

There is no PHP fix for CVE-2026-115560 yet. As a mitigation, all images ship with `session.upload_progress.enabled = 0`, so applications that poll upload progress no longer receive progress data. If you need the feature and accept the risk, enable it again:

```sh
docker run --rm -it -e PHP.session.upload_progress.enabled=1 sunasteriskrnd/php
```

This default will be removed once PHP releases a fix.
