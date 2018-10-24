FROM openjdk:11.0.1-jre-slim

MAINTAINER buzzxu <downloadxu@163.com>

# 设置相应的时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install -y locales vim && \
    locale-gen zh_CN.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive apt-get --purge remove -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    apt-get clean 
    

# Default to UTF-8 file.encoding
ENV LANG zh_CN.UTF-8