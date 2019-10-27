# Ahora SPA
## Introduction
Loading static files from tar file and serve them with nginx container.

## Usage
``` 
$ docker run -e SPAARCHIVEURL=https://ahora.dev/archive.tar.gz -p 8080:80 ahora/spa:latest
```

## TODOs
* Allow to configure more advnaced nginx parameters
* Support SSL.
* Support different file formats
* Writing tests