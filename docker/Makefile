IMAGE=privoxy-nordvpn

.PHONY: all build

all: build

build:
	docker build --network=host --rm -t $(IMAGE) .
