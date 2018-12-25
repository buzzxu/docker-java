FROM adoptopenjdk/openjdk11-openj9:alpine-slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN apk update && apk upgrade && \
    apk add --no-cache -U tzdata && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del curl ca-certificates openssl xz && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENV JAVA_VERSION 11.0.1
ENV TZ Asia/Shanghai
ENV LANG C.UTF-8