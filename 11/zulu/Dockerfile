FROM azul/zulu-openjdk-alpine:11 AS jlink

LABEL MAINTAINER buzzxu <downloadxu@163.com>

## jdir=$(dirname $(dirname $(find /usr/lib/jvm -name javac)))
RUN jdir=$(dirname $(dirname $(find /usr/lib/jvm -name javac))) && \
    jlink --compress=2  --no-man-pages --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml --bind-services --output /jre
 
FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache -U tzdata fontconfig ttf-dejavu && \
    rm /etc/localtime && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 

ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
ENV JAVA_VERSION 11.0.1
ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin

