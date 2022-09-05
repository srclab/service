SHELL := /bin/zsh

run: 
	go run main.go

# ==============================================================================
# Building containers

VERSION := 1.0

all: sales metrics

service:
	docker build \
		-f zarf/docker/dockerfile \
		-t sales-amd64:$(VERSION) \
		--build-arg BUILD_REF=$(VERSION) \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		.
