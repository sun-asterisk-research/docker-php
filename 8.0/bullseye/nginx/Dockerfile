# Generated via generate.sh. Please don't edit directly

FROM php:8.0.16-fpm-bullseye

ENV RUN_DEPS \
    zlib1g \
    libzip4 \
    libpng16-16 \
    libjpeg62-turbo \
    libpq5

ENV BUILD_DEPS \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libpq-dev

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

RUN apt-get update \
    && apt-get install -y $RUN_DEPS $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && apt-get purge -y --autoremove $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install $PECL_EXTENSIONS \
    && docker-php-ext-enable $PECL_EXTENSIONS

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base

COPY rootfs /

RUN apt-get update \
    && apt-get install -y nginx gettext-base \
    && rm -rf /var/lib/apt/lists/*

ENV S6_OVERLAY_RELEASE=https://github.com/just-containers/s6-overlay/archive/refs/tags/v3.0.0.2.tar.gz

RUN curl -sL ${S6_OVERLAY_RELEASE} | tar xzf - -C /

RUN mkdir -p /run/nginx /run/php

ENV DOCUMENT_ROOT=/var/www/html

EXPOSE 80 443

ENTRYPOINT [ "/init" ]
