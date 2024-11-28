
## Install MongoDB

<https://www.mongodb.com/resources/products/compatibilities/docker>

```bash
export MONGODB_VERSION=6.0-ubi8
docker run --name mongodb -d \
  -p 127.0.0.1:27017:27017 \
  -v ./mongodb/data/db:/data/db \
  mongodb/mongodb-community-server:$MONGODB_VERSION
```

## Compass GUI

<https://www.mongodb.com/products/tools/compass>
