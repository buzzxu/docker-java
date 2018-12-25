FROM adoptopenjdk/openjdk11:slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

# 无需向用户请求输入
# RUN DEBIAN_FRONTEND noninteractive
# 设置相应的时区
RUN apt-get update && \
    apt-get upgrade -y && \
    #ubuntu 需要安装tzdata
    apt-get install -y --no-install-recommends tzdata && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    apt autoremove -y && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 
    
ENV JAVA_VERSION 11.0.1
ENV JAVA_BUILD_VERSION 11.0.1+13-3
ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
