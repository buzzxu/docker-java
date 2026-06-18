FROM eclipse-temurin:25-jdk-alpine AS jlink


RUN apk add --no-cache binutils tar && \
    modules=java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs,jdk.localedata,jdk.charsets,jdk.crypto.ec && \
    $JAVA_HOME/bin/jlink \
        --compress=zip-6 \
        --no-man-pages \
        --no-header-files \
        --strip-debug \
        --module-path $JAVA_HOME/jmods \
        --add-modules "$modules" \
        --bind-services \
        --output /jre

FROM alpine:latest

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN apk add --no-cache -U tzdata font-adobe-100dpi fontconfig ttf-dejavu && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

COPY fonts/ /usr/share/fonts/

RUN fc-cache -vf

COPY --from=jlink /jre /opt/jre/

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 25
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
