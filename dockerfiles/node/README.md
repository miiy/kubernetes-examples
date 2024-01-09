## Build

```bash
docker build -t nodedemo --build-arg DOCKER_NODE_VERSION=13 .
```

## Run

```bash
docker run -it --rm -v "$PWD":/data -p 8080:8080 nodedemo sh
docker run -it --rm -v "$PWD":/data -p 8000:8000 -p 8080:8080 --network frontend nodedemo sh
```
