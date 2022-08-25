# NOTE: This file was generated via generate.sh. Don't edit it directly

FROM php:7.3.33-fpm-buster

ENV RUN_DEPS \
    zlib1g \
    libzip4 \
    libpng16-16 \
    libjpeg62-turbo \
    libpq5

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

ENV PECL_EXTENSIONS \
    redis

RUN apt-get update \
    && apt-get install -y $RUN_DEPS $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && apt-get purge -y --autoremove $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install $PECL_EXTENSIONS \
    && docker-php-ext-enable $PECL_EXTENSIONS

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base

COPY rootfs /

RUN set -x \
    && groupadd --system --gid 101 nginx \
    && useradd --system --no-create-home --uid 101 --gid nginx --groups www-data --home-dir /nonexistent --comment "nginx user" --shell /bin/false nginx

RUN apt-get update \
    && apt-get install -o Dpkg::Options::="--force-confold" -y nginx gettext-base \
    && rm -rf /var/lib/apt/lists/*

COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 / /

RUN mkdir -p /run/nginx /run/php \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

ENV DOCUMENT_ROOT=/var/www/html

EXPOSE 80 443

ENTRYPOINT [ "docker-php-entrypoint" ]

CMD [ "/init", "nginx", "-g", "daemon off;" ]
