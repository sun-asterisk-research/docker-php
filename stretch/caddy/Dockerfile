# Generated via generate.sh. Please don't edit directly

FROM abiosoft/caddy:no-stats as caddy

FROM php:7.3-fpm-stretch

ENV RUN_DEPS \
    zlib1g \
    libzip4 \
    libpng16-16 \
    libjpeg62-turbo \
    libpq5 \
    gettext

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

RUN apt-get update \
    && apt-get install -y $RUN_DEPS $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && apt-get purge -y --autoremove $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*

COPY config /usr/local/etc/php/conf.d
COPY php-fpm /usr/local/etc/php-fpm.d

COPY --from=caddy /bin/parent /bin/parent
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile

COPY php-caddy-entrypoint /usr/local/bin/

EXPOSE 2015

ENTRYPOINT [ "php-caddy-entrypoint" ]

CMD ["--conf", "/etc/Caddyfile", "--agree"]
