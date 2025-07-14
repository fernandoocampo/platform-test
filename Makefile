CONTAINER_TOOL?=docker
GORELEASER_VERSION?=v2.11.0

.PHONY: init
init:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) init

.PHONY: check
check:
	$(CONTAINER_TOOL) run --rm -v $(shell pwd):/src -w /src goreleaser/goreleaser:$(GORELEASER_VERSION) check

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
	./artifacts/example-build_darwin_arm64_v8.0/platform-test -name digi