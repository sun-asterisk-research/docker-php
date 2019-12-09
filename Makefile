PHP_VERSION?=7.4
DEBIAN_SUITE?=buster

ALL_VERSIONS?=7.3 7.4

ALPINE_IMAGES=$(PHP_VERSION)-cli-alpine $(PHP_VERSION)-fpm-alpine $(PHP_VERSION)-caddy-alpine
DEBIAN_IMAGES=$(PHP_VERSION)-cli-$(DEBIAN_SUITE) $(PHP_VERSION)-fpm-$(DEBIAN_SUITE) $(PHP_VERSION)-caddy-$(DEBIAN_SUITE)

IMAGES=$(ALPINE_IMAGES) $(DEBIAN_IMAGES)

$(ALPINE_IMAGES):
	@echo "Generating sunasteriskrnd/php:$@"
	@./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

$(DEBIAN_IMAGES):
	@echo "Generating sunasteriskrnd/php:$@"
	@DEBIAN_SUITE=$(DEBIAN_SUITE) ./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

alpine: $(ALPINE_IMAGES)

debian $(DEBIAN_SUITE): $(DEBIAN_IMAGES)

all:
	@for version in $(ALL_VERSIONS); do \
		PHP_VERSION=$$version $(MAKE) -s alpine debian; \
	done

docker-build:
	@echo "Building image sunasteriskrnd/php:$$image"
	@ctx=$$(echo $$image | awk -F '-' '{if($$3){print $$1"/"$$3"/"$$2}else if($$2){print $(PHP_VERSION)/$$2"/"$$1}else{print "$(PHP_VERSION)/alpine/"$$1}}') && \
	docker build $$ctx -t sunasteriskrnd/php:$$image

clean:
	rm -rf $(ALL_VERSIONS)
	docker ps -qf ancestor=sunasteriskrnd/php | xargs -r docker kill
	docker ps -aqf ancestor=sunasteriskrnd/php | xargs -r docker rm
	docker images -q sunasteriskrnd/php | xargs -r docker rmi -f
