FROM openjdk:12-alpine

LABEL MAINTAINER buzzxu <downloadxu@163.com>


RUN apk update && apk upgrade && \
    apk add --no-cache -U tzdata && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del curl ca-certificates openssl xz && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

    
ENV TZ Asia/Shanghai
# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

