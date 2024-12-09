FROM debian:bookworm

WORKDIR /app

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && cat /etc/apt/sources.list.d/debian.sources \
    && echo "\n" \
    && cat /etc/apt/sources.list.d/debian.sources

RUN apt-get update \
    && apt-get install -y ssh git vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
# https://cfdownload.adobe.com/pub/adobe/coldfusion/java/java8/java8u431/jdk/jdk-8u431-linux-x64.tar.gz
COPY jdk-8u431-linux-x64.tar.gz /usr/local/src

RUN cd /usr/local/src \
    && tar -zxvf jdk-8u431-linux-x64.tar.gz \
    && mv jdk1.8.0_431 ..

RUN echo "export JAVA_HOME=/usr/local/jdk1.8.0_431" >> /root/.bashrc \
    && echo "export PATH=$PATH:/usr/local/jdk1.8.0_431/bin" >> /root/.bashrc

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
