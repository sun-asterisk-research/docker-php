FROM php:7.2-fpm-alpine

LABEL maintainer="1@grep.su"

ENV EXTENSION_DEPS \
    icu-libs \
    postgresql-libs \
    zlib

ENV BUILD_DEPS \
    icu-dev \
    postgresql-dev \
    zlib-dev

RUN apk add --no-cache --virtual .extension-deps $EXTENSION_DEPS

# PHP extensions
RUN apk add --no-cache --virtual .build-deps $BUILD_DEPS \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} \
        intl \
        zip \
        pgsql \
        pdo_pgsql \
        opcache \
    && apk del .build-deps

# mongodb extension
# May be move this to the previous layer and share `.phpize-deps` with `docker-php-ext-install`
# so we don't have to install it again
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && apk del .phpize-deps

# Config files
COPY config/php.ini /usr/local/etc/php/
COPY config/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

CMD ["php-fpm"]
