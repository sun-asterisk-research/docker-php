PHP_VERSION?=7.4
DEBIAN_SUITE?=buster

ALPINE_IMAGES=$(PHP_VERSION)-cli-alpine $(PHP_VERSION)-fpm-alpine $(PHP_VERSION)-caddy-alpine
DEBIAN_IMAGES=$(PHP_VERSION)-cli-$(DEBIAN_SUITE) $(PHP_VERSION)-fpm-$(DEBIAN_SUITE) $(PHP_VERSION)-caddy-$(DEBIAN_SUITE)

IMAGES=$(ALPINE_IMAGES) $(DEBIAN_IMAGES)

$(ALPINE_IMAGES):
	@echo "Generating viblo/php:$@"
	@./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

$(DEBIAN_IMAGES):
	@echo "Generating viblo/php:$@"
	@DEBIAN_SUITE=$(DEBIAN_SUITE) ./generate.sh $$(echo $@ | awk -F '-' '{print $$1" "$$2" "$$3}')

alpine: $(ALPINE_IMAGES)

debian $(DEBIAN_SUITE): $(DEBIAN_IMAGES)

all: alpine debian

docker-build:
	@echo "Building image viblo/php:$$image"
	@ctx=$$(echo $$image | awk -F '-' '{if($$3){print $$1"/"$$3"/"$$2}else if($$2){print $(PHP_VERSION)/$$2"/"$$1}else{print "$(PHP_VERSION)/alpine/"$$1}}') && \
	docker build $$ctx -t viblo/php:$$image

clean:
	rm -rf $(PHP_VERSION)
	docker ps -qf ancestor=viblo/php | xargs -r docker kill
	docker ps -aqf ancestor=viblo/php | xargs -r docker rm
	docker images -q viblo/php | xargs -r docker rmi -f
