FROM abiosoft/caddy:no-stats as caddy

FROM php:7.2-fpm-alpine

ENV EXTENSION_DEPS \
    zlib \
    libpng \
    postgresql-libs

ENV BUILD_DEPS \
    zlib-dev \
    libpng-dev \
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

# PHP extensions
RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS

RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} $PHP_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache gettext

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

COPY --from=caddy /bin/parent /bin/parent
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/Caddyfile

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 2015

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["--conf", "/etc/Caddyfile", "--agree"]
