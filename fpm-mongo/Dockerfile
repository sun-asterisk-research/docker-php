FROM php:7.1-fpm-alpine

LABEL maintainer="1@grep.su"

RUN apk update && apk upgrade --no-cache

RUN if [ -n "$PHPIZE_DEPS" ] \
        && ! apk info --installed .phpize-deps > /dev/null \
        && ! apk info --installed .phpize-deps-configure > /dev/null \
	; then \
		apk add --no-cache --virtual .phpize-deps-configure $PHPIZE_DEPS \
	; fi

RUN apk add --no-cache --virtual .ext-configure \
    openssl-dev \
    icu-dev \
    libmcrypt-dev \
    postgresql-dev

RUN apk add --no-cache --virtual .ext-deps \
    freetype \
    libpng \
    libjpeg-turbo

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} \
    intl \
    iconv \
    mcrypt \
    zip \
    pdo \
    pgsql \
    pdo_pgsql
