FROM debian:sid-slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

# 无需向用户请求输入
# RUN DEBIAN_FRONTEND noninteractive
# 设置相应的时区
RUN set -eux; \
    rm -rf /var/lib/apt/lists/* && \  
    apt-get clean && \
    apt-get update -qq && \ 
    apt-get upgrade -y && \
    apt-get install -qq -y --no-install-recommends curl ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    # 下载jdk    
    curl -Lso /tmp/openjdk.tar.gz "https://api.adoptopenjdk.net/v2/binary/releases/openjdk11?openjdk_impl=hotspot&os=linux&type=jdk&release=latest&heap_size=normal&arch=x64" && \
    mkdir -p /opt/java/openjdk && \
    chmod +x /opt/java/openjdk && \
    cd /opt/java/openjdk && \
    tar -xf /tmp/openjdk.tar.gz && \
    jdir=$(dirname $(dirname $(find /opt/java/openjdk -name javac))) && \
    mv ${jdir}/* /opt/java/openjdk && \
    rm -rf ${jdir} /tmp/openjdk.tar.gz  && \
    apt-get --purge remove -y curl && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 
    
ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
ENV JAVA_VERSION 11.0.1
ENV JAVA_HOME /opt/java/openjdk
ENV PATH $PATH:$JAVA_HOME/bin
