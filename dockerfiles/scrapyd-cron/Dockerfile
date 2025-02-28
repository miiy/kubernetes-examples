FROM debian:bookworm

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && cat /etc/apt/sources.list.d/debian.sources \
    && apt update

RUN apt install -y procps vim cron curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN touch /var/log/cron.log

# Create entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]