
#! /bin/bash
IMG ?= ahora/spa:0.0.3
CONTAINER_NAME ?= spa
ARCHIVE?=https://storage.googleapis.com/alster-crosswords/crosswords-1.0.6.tar.tz

clean:
	docker stop $(CONTAINER_NAME); docker rm $(CONTAINER_NAME)

run:  docker-build
	docker stop $(CONTAINER_NAME) && docker rm $(CONTAINER_NAME)
	docker run -p 80:80 -e SPAARCHIVEURL='${ARCHIVE}' --name="$(CONTAINER_NAME)" ${IMG} 
test: docker-build
	docker stop $(CONTAINER_NAME) && docker rm $(CONTAINER_NAME) && true
	docker run -d -p 80:80 -e SPAARCHIVEURL='${ARCHIVE}' --name="$(CONTAINER_NAME)" ${IMG} 
	sleep 5
	curl -I http://localhost && docker stop $(CONTAINER_NAME) && docker rm $(CONTAINER_NAME)
	docker stop $(CONTAINER_NAME)

docker-build:
	docker build -t ${IMG} .

docker-push:
	docker push ${IMG}


all: docker-build docker-push