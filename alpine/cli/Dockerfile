# Generated via generate.sh. Please don't edit directly

FROM php:7.3-cli-alpine

ENV RUN_DEPS \
    zlib \
    libzip \
    libpng \
    libjpeg-turbo \
    postgresql-libs \
    gettext

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

RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache --virtual .run-deps $RUN_DEPS

COPY config /usr/local/etc/php/conf.d
COPY php-cli-entrypoint /usr/local/bin

ENV OPCACHE_VALIDATE_TIMESTAMPS=1

ENTRYPOINT [ "php-cli-entrypoint" ]

CMD ["php", "-a"]
