CONTAINER_TOOL?=docker
GORELEASER_VERSION?=v2.11.0
PROFILE_ID?=example-build-1

.PHONY: init
init:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) init

.PHONY: check
check:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) check

.PHONY: build
build:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) build --id=$(PROFILE_ID) --snapshot --clean

.PHONY: build-2
build-2:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) build --id=example-build-2 --snapshot --clean

.PHONY: release
release:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) release --snapshot --skip=publish --clean

.PHONY: healthcheck
healthcheck:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) healthcheck

.PHONY: clean
clean:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) --clean

.PHONY: help
help:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) --help

.PHONY: run-example
run-example:
	./artifacts/example-build_darwin_arm64_v8.0/platform-test -name one

.PHONY: run-example-2
run-example-2:
	./artifacts/platform-test-darwin-arm64 -name two