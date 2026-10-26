#!/bin/sh
# Re-applies the patches the official php:8.1.34 Alpine images apply to the pristine
# php.tar.xz, so the rebuilt runtime keeps the same fixes. Run from the PHP source root.
# Checksums are the ones docker-library/php pins for these php-src commits.

set -eux

dir="$(dirname "$0")"

(cd "$dir" && sha256sum -c -) << 'EOF'
6edc20c3bb3e7cc13515abce7f2fffa8ebea6cf7469abfbc78fcdc120350b239 *11678.patch
c98c01c74d3a6da197116f8511b16fed361ca6bbb6a8af8df629a933f541c213 *19131.patch
ed10a1b254091ad676ed204e55628ecbd6c8962004d6185a1821cedecd526c0f *14834.patch
EOF

# php-src 577b8ae4226368e66fee7a9b5c58f9e2428372fc (GH-11678)
patch -p1 < "$dir/11678.patch"
# php-src a5df26691d1b1f71b964b869510473a5d5413999 (GH-19131), applied in reverse
patch --reverse -p1 < "$dir/19131.patch"
# php-src 67259e451d5d58b4842776c5696a66d74e157609 (GH-14834), without its NEWS hunk
filterdiff -x '*/NEWS' "$dir/14834.patch" | patch -p1
