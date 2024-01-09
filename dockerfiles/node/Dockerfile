ARG DOCKER_NODE_VERSION

FROM node:${DOCKER_NODE_VERSION}-alpine

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN cnpm install -g webpack

WORKDIR /data
