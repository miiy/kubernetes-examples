# !/bin/sh

# Build
# docker build -t docker-rabbitmq:1.0 --build-arg RABBIMQ_VERSION=3.8 .

docker run --rm --name myabbitmq -d --restart=always \
    -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=123456 \
    -p 127.0.0.1:4369:4369 -p 127.0.0.1:5671:5671 -p 127.0.0.1:5672:5672 -p 127.0.0.1:15672:15672 \
    -v /home/www/appdata/rabbitmq:/var/lib/rabbitmq \
    docker-rabbitmq:1.0

# Management Plugin
# visiting http://localhost:15672/
# Username: admin
# Password: 123456
