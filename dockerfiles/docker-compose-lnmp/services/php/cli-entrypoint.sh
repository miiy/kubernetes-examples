#!/bin/sh
set -e

crond -L /var/log/crond.log
supervisord -c /etc/supervisord.conf

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- php "$@"
fi

exec "$@"

# docker-compose
#
#     entrypoint: /usr/local/bin/cli-entrypoint.sh
#     command: ["php", "-a"]

# Dockerfile
#
# COPY ./cli-entrypoint.sh /usr/local/bin/
# RUN if [ ${DOCKER_PHP_MODE} = "cli" ]; then \
#         chmod +x /usr/local/bin/cli-entrypoint.sh; \
#     else \
#         rm /usr/local/bin/cli-entrypoint.sh; \
#     fi
