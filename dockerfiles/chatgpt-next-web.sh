#!/bin/sh

docker run --name chatgpt-next-web -d --restart=always \
    --add-host=host.docker.internal:host-gateway \
    -e PROXY_URL=http://172.17.0.1:7890 \
    --net frontend \
    yidadaa/chatgpt-next-web:v2.10.1

# nginx stream
# https://github.com/Yidadaa/ChatGPT-Next-Web/blob/main/docs/faq-en.md
