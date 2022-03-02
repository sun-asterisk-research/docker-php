PHP_VERSION?=8.1
DEBIAN_SUITE?=buster

generate:
	@./generate.sh

clean:
	@./generate.sh clean

all: clean generate
