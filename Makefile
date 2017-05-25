.PHONY: docs

IMAGE_NAME=container-camp-sydney-2017
PORT=8080

default: docs

docker-build:
	docker build -t $(IMAGE_NAME) .

build: docker-build
	docker run -it --rm -v "$(CURDIR)":/usr/src/app -p $(PORT):$(PORT) $(IMAGE_NAME) build --clean

docs: docker-build
	docker run -it --rm -v "$(CURDIR)":/usr/src/app -p $(PORT):$(PORT) $(IMAGE_NAME)
