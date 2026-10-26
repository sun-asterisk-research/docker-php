# NOTE: This file was generated via generate.sh. Don't edit it directly

FROM php:8.2.35-fpm-bookworm

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

# Runtime libraries are derived from the built extensions, so package names stay release-independent
RUN set -eux \
    && savedAptMark="$(apt-mark showmanual)" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $BUILD_DEPS \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j "$(nproc)" $PHP_EXTENSIONS \
    && pecl install $PECL_EXTENSIONS \
    && docker-php-ext-enable $PECL_EXTENSIONS \
    && apt-mark auto '.*' > /dev/null \
    && { [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; } \
    && find /usr/local -type f -executable -exec ldd '{}' ';' \
        | awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); printf "*%s\n", so }' \
        | sort -u \
        | xargs -r dpkg-query --search \
        | awk 'sub(":$", "", $1) { print $1 }' \
        | sort -u \
        | xargs -r apt-mark manual \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/* /tmp/pear

RUN mv /usr/local/bin/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint-base

COPY rootfs /

# Upload progress tracking is an RCE path (CVE-2026-115560) until PHP ships a fix
RUN echo 'session.upload_progress.enabled = 0' > "$PHP_INI_DIR/conf.d/docker-php-session-upload-progress.ini"

# Fail the build if any extension lost a runtime library, which PHP only reports as a startup warning
RUN php -m > /dev/null && ! php -m 2>&1 | grep -iE 'warning|unable to load'

RUN set -x \
    && groupadd --system --gid 101 nginx \
    && useradd --system --no-create-home --uid 101 --gid nginx --groups www-data --home-dir /nonexistent --comment "nginx user" --shell /bin/false nginx

RUN apt-get update \
    && apt-get install -o Dpkg::Options::="--force-confold" -y nginx gettext-base \
    && rm -rf /var/lib/apt/lists/*

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
