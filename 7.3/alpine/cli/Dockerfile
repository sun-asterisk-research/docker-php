# Generated via generate.sh. Please don't edit directly

FROM php:7.3-cli-alpine

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
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include \
    && pecl install $PECL_EXTENSIONS \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && docker-php-ext-enable $PECL_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache --virtual .run-deps $RUN_DEPS

COPY config /usr/local/etc/php/conf.d
COPY php-cli-entrypoint /usr/local/bin

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/base-docker-php-entrypoint \
    && ln -s /usr/local/bin/php-cli-entrypoint /usr/local/bin/docker-php-entrypoint

ENV OPCACHE_VALIDATE_TIMESTAMPS=1

ENTRYPOINT [ "php-cli-entrypoint" ]

CMD ["php", "-a"]
