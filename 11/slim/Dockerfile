FROM debian:sid-slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

# 无需向用户请求输入
# RUN DEBIAN_FRONTEND noninteractive
# 设置相应的时区
RUN rm -rf /var/lib/apt/lists/* && \ 
    apt-get clean && \ 
    apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl ca-certificates tzdata && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    # 下载jdk
    ESUM='07332180068756f3afd287701499ed7e9194fd9e5797a3104f57b21291eae7ea';  \
    curl -Lso /tmp/openjdk.tar.gz 'https://api.adoptopenjdk.net/v2/binary/releases/openjdk11?openjdk_impl=hotspot&os=linux&type=jdk&release=latest&heap_size=normal&arch=x64'; \
    sha256sum /tmp/openjdk.tar.gz; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    echo "${ESUM}  /tmp/openjdk.tar.gz" | sha256sum -c -; \
    tar -xf /tmp/openjdk.tar.gz; \
    jdir=$(dirname $(dirname $(find /opt/java/openjdk -name javac))); \
    mv ${jdir}/* /opt/java/openjdk;  \
    ln -svT /opt/java/openjdk /java-home; \
    rm -rf ${jdir} /tmp/openjdk.tar.gz; \
    apt-get purge -y --auto-remove curl && \
    apt autoremove -y && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 
    
ENV JAVA_HOME=/java-home \
    PATH="$JAVA_HOME/bin:$PATH"   
ENV JAVA_VERSION 11.0.1
ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
