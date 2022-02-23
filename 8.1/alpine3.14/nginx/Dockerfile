# Generated via generate.sh. Please don't edit directly

FROM php:8.1.3-fpm-alpine3.14

ENV RUN_DEPS \
    zlib \
    libzip \
    libpng \
    libjpeg-turbo \
    postgresql-libs

ENV BUILD_DEPS \
    zlib-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    postgresql-dev

ENV PHP_EXTENSIONS \
    opcache \
    zip \
    gd \
    bcmath \
    mysqli \
    pdo_mysql \
    pgsql \
    pdo_pgsql

ENV PECL_EXTENSIONS \
    redis

RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg \
    && pecl install $PECL_EXTENSIONS \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && docker-php-ext-enable $PECL_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache --virtual .run-deps $RUN_DEPS

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base

COPY rootfs /

RUN apk add --no-cache nginx gettext

ENV S6_OVERLAY_RELEASE=https://github.com/just-containers/s6-overlay/archive/refs/tags/v3.0.0.2.tar.gz

RUN curl -sL ${S6_OVERLAY_RELEASE} | tar xzf - -C /

RUN mkdir -p /run/nginx /run/php

ENV DOCUMENT_ROOT=/var/www/html

EXPOSE 80 443

ENTRYPOINT [ "/init" ]
