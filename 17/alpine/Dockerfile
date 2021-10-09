FROM eclipse-temurin:17-alpine AS jlink


RUN $JAVA_HOME/bin/jlink \
        --compress=2  \
        --no-man-pages \
        --no-header-files \
        --strip-debug \
        --module-path $JAVA_HOME/jmods \
        --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.incubator.foreign,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs \
        --bind-services \
        --output /jre
 
FROM alpine:latest

LABEL MAINTAINER buzzxu <downloadxu@163.com>

COPY fonts/ /usr/share/fonts/

RUN apk update && apk upgrade && \
    apk add --no-cache -U tzdata font-adobe-100dpi fontconfig ttf-dejavu && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 17
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"

