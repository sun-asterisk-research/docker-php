# NOTE: This file was generated via generate.sh. Don't edit it directly

FROM php:8.2.35-fpm-alpine3.23

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

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base

COPY rootfs /

# Upload progress tracking is an RCE path (CVE-2026-115560) until PHP ships a fix
RUN echo 'session.upload_progress.enabled = 0' > "$PHP_INI_DIR/conf.d/docker-php-session-upload-progress.ini"

# Fail the build if any extension lost a runtime library, which PHP only reports as a startup warning
RUN php -m > /dev/null && ! php -m 2>&1 | grep -iE 'warning|unable to load'

RUN set -x \
    && addgroup -g 101 -S nginx \
    && adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin -g nginx -G www-data nginx

RUN apk add --no-cache nginx gettext

# Only the runtime paths: the dist also ships /lib and /include build leftovers,
# and /lib is a symlink on merged-usr bases such as Debian bookworm
COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 /init /init
COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 /command /command
COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 /package /package
COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 /etc/s6-overlay /etc/s6-overlay
COPY --from=crazymax/alpine-s6-dist:3.15-3.0.0.2 /usr/bin /usr/bin

RUN mkdir -p /run/nginx /run/php \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

ENV DOCUMENT_ROOT=/var/www/html

EXPOSE 80 443

ENTRYPOINT [ "docker-php-entrypoint" ]

CMD [ "/init", "nginx", "-g", "daemon off;" ]
