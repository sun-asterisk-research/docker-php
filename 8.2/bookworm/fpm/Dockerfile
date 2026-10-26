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

RUN apt-get update \
    && apt-get install -y fcgiwrap \
    && rm -rf /var/lib/apt/lists/*

# For backward compatibility
RUN ln -s /usr/local/bin/docker-php-entrypoint /usr/local/bin/php-fpm-entrypoint

ENTRYPOINT [ "docker-php-entrypoint" ]

CMD [ "php-fpm" ]
