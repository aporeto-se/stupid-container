BUILD_NUMBER := latest
PROJECT_NAME := stupid-container
DOCKER_REGISTRY := jodydadescott
DOCKER_IMAGE_NAME?=$(PROJECT_NAME)
DOCKER_IMAGE_TAG?=$(BUILD_NUMBER)

KUBE_VER := $(shell curl -L -s https://dl.k8s.io/release/stable.txt)

build:
	$(MAKE) cache
	docker build -t $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

shell:
	docker run -it $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) bash

push:
	docker push $(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

cache:
	rm -rf tmp && mkdir tmp
	cd tmp && curl -LO "https://dl.k8s.io/release/$(KUBE_VER)/bin/linux/amd64/kubectl"
	mv tmp cache

clean:
	rm -rf cache
