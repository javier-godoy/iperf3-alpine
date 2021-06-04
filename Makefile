TAG = jgodoy/iperf3\:latest

.PHONY: build

build:
	docker build . -t $(TAG)

install: build
