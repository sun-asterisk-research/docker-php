PHP_VERSION=7.3
DEBIAN_SUITE=stretch

ALPINE_IMAGES=${PHP_VERSION}-cli-alpine ${PHP_VERSION}-fpm-alpine ${PHP_VERSION}-caddy-alpine
DEBIAN_IMAGES=${PHP_VERSION}-cli-${DEBIAN_SUITE} ${PHP_VERSION}-fpm-${DEBIAN_SUITE} ${PHP_VERSION}-caddy-${DEBIAN_SUITE}

IMAGES=${ALPINE_IMAGES} ${DEBIAN_IMAGES}

.PHONY: ${IMAGES} all

${ALPINE_IMAGES}:
	@echo "Generating viblo/php:$@"
	@./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

${DEBIAN_IMAGES}:
	@echo "Generating viblo/php:$@"
	@DEBIAN_SUITE=${DEBIAN_SUITE} ./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

alpine: ${ALPINE_IMAGES}

debian ${DEBIAN_SUITE}: ${DEBIAN_IMAGES}

all: clean ${IMAGES}

clean:
	rm -rf alpine ${DEBIAN_SUITE}
