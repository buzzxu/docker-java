FROM openjdk:11.0.1-jre-slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

# 无需向用户请求输入
# RUN DEBIAN_FRONTEND noninteractive
# 设置相应的时区
RUN apt-get update && \
    apt-get upgrade -y && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 
    
ENV TZ Asia/Shanghai
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
