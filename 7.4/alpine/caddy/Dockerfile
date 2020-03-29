# Generated via generate.sh. Please don't edit directly

FROM abiosoft/caddy:no-stats as caddy

FROM php:7.4-fpm-alpine

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

COPY config /usr/local/etc/php/conf.d
COPY php-fpm.d /usr/local/etc/php-fpm.d

COPY --from=caddy /bin/parent /bin/parent
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile

COPY php-caddy-entrypoint /usr/local/bin/

EXPOSE 2015

ENTRYPOINT [ "php-caddy-entrypoint" ]

CMD ["--conf", "/etc/Caddyfile", "--agree"]
