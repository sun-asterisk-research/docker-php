FROM php:7.2-cli-alpine

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

RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS

# PHP extensions
RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} $PHP_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache gettext

COPY config /tmp/php-conf
COPY docker-entrypoint.sh /usr/local/bin

ENV OPCACHE_VALIDATE_TIMESTAMPS=1

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["php", "-a"]
