FROM php:7.2-fpm-alpine

LABEL maintainer="1@grep.su"

ENV EXTENSION_DEPS \
    icu-libs \
    postgresql-libs \
    zlib

ENV BUILD_DEPS \
    icu-dev \
    postgresql-dev \
    zlib-dev

# PHP extensions
RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS

RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} \
        intl \
        zip \
        pgsql \
        pdo_pgsql \
        opcache \
    && apk del .build-deps

# mongodb extension
# May be move this to the previous layer and share `.phpize-deps` with `docker-php-ext-install`
# so we don't have to install it again
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && apk del .phpize-deps

RUN apk add --no-cache fcgi gettext

ENV PM_MODE=ondemand \
    PM_MAX_CHILDREN=40 \
    PM_START_SERVERS=15 \
    PM_MIN_SPARE_SERVERS=15 \
    PM_MAX_SPARE_SERVERS=25 \
    PM_PROCESS_IDLE_TIMEOUT=10s \
    OPCACHE_VALIDATE_TIMESTAMPS=1

# Config files
COPY config /tmp/php-conf
COPY php-fpm /tmp/php-fpm

COPY config docker-entrypoint.sh /

COPY docker-entrypoint.sh php-fpm-healthcheck /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["php-fpm"]
