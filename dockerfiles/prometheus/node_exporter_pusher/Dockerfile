FROM debian:bookworm

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && cat /etc/apt/sources.list.d/debian.sources \
    && apt update

RUN apt install -y procps vim cron curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# /usr/bin/push_node_exporter_metrics.sh
RUN touch /var/log/cron.log
RUN echo "#!/bin/bash\nsource ~/.env\ncurl -s \$NODE_EXPORTER_SERVER/metrics | gzip | curl --insecure -u \$PUSHGATEWAY_AUTH -H 'Content-Encoding: gzip' --data-binary @- \$PUSHGATEWAY_SERVER/metrics/job/node-exporter/instance/\$NODE_NAME" > /usr/bin/push_node_exporter_metrics.sh
RUN chmod +x /usr/bin/push_node_exporter_metrics.sh

# cron
RUN echo "*/1 * * * * /usr/bin/push_node_exporter_metrics.sh >> /var/log/cron.log 2>&1" > /var/spool/cron/crontabs/root
RUN chmod 600 /var/spool/cron/crontabs/root
# RUN chown root:crontab /var/spool/cron/crontabs/root

CMD ["sh", "-c", "cron && tail -f /var/log/cron.log"]
