ALPINE_TAG=3.13
TAG = jgodoy/iperf3\:alpine-$(ALPINE_TAG)

.PHONY: build

build:
	docker build . -t $(TAG) \
		--build-arg ALPINE_TAG=$(ALPINE_TAG) \

install: build
