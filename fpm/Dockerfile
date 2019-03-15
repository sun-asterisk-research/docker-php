FROM php:7.3-fpm-alpine

ENV EXTENSION_DEPS \
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

RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS
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

COPY docker-entrypoint.sh php-fpm-healthcheck /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["php-fpm"]
