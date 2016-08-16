GIT_COMMIT=$(shell git log -1 --pretty=format:%H)
GIT_BRANCH=$(shell git symbolic-ref --short HEAD)

dc-builder:
	docker build --build-arg GIT_COMMIT=$(GIT_COMMIT) --build-arg GIT_BRANCH=$(GIT_BRANCH) --tag dc-builder:latest .

.PHONY: dc-builder
