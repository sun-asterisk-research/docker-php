FROM php:7.2-cli-alpine

LABEL maintainer="1@grep.su"

ENV EXTENSION_DEPS \
    icu-libs \
    zlib

ENV BUILD_DEPS \
    icu-dev \
    zlib-dev

ENV PHP_EXTENSIONS \
    opcache \
    zip \
    intl \
    mysqli \
    pdo_mysql

RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS

# PHP extensions
RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} $PHP_EXTENSIONS \
    && apk del .build-deps

RUN apk add --no-cache gettext
RUN mkdir /tmp/php-opcache

COPY config /tmp/php-conf
COPY docker-entrypoint.sh /usr/local/bin

ENV OPCACHE_VALIDATE_TIMESTAMPS=1

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["php", "-a"]
