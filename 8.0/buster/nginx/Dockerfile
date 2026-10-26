# NOTE: This file was generated via generate.sh. Don't edit it directly

FROM php:8.0.30-fpm-buster

# Debian buster is end-of-life and its packages moved to archive.debian.org
RUN sed -i -e 's|deb.debian.org|archive.debian.org|g' -e '/buster-updates/d' /etc/apt/sources.list

# Rebuild PHP from the image's own source with the upstream security backport applied,
# reusing the official configure options and compiler flags
COPY patches /usr/local/share/php-patches

LABEL io.github.sun-asterisk-research.php.patches="82f8f31b16a035c1b67cc253e79f7cc288f4cc20"

RUN set -eux \
    && cd /usr/local/share/php-patches \
    && echo "534478c973cef6f493605b7af907f639a364912ee92c24598ddae44c3bc72d1c  php-8.0.30-CVE-2026-109618-109619.patch" | sha256sum -c - \
    && savedAptMark="$(apt-mark showmanual)" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libargon2-dev \
        libcurl4-openssl-dev \
        libonig-dev \
        libreadline-dev \
        libsodium-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        patch \
        patchutils \
        zlib1g-dev \
    && configure_options="$(php-config --configure-options)" \
    && build_provider="$(php -i | sed -n 's/^Build Provider => //p')" \
    && if [ -n "$build_provider" ]; then export PHP_BUILD_PROVIDER="$build_provider" PHP_UNAME='Linux - Docker'; fi \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && docker-php-source extract \
    && cd /usr/src/php \
    && if [ -f /usr/local/share/php-patches/base/apply.sh ]; then sh /usr/local/share/php-patches/base/apply.sh; fi \
    && patch -p1 < /usr/local/share/php-patches/php-8.0.30-CVE-2026-109618-109619.patch \
    && eval "./configure $configure_options" \
    && make -j "$(nproc)" \
    && find -type f -name '*.a' -delete \
    && make install \
    && find /usr/local -type f -perm '/0111' -exec sh -euxc 'strip --strip-all "$@" || :' -- '{}' + \
    && cd / \
    && docker-php-source delete \
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
    && rm -rf /var/lib/apt/lists/* /tmp/pear ~/.pearrc \
    && php --version

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
