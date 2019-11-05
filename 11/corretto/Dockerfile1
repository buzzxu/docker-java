FROM amazoncorretto:11 AS jlink

RUN jdir=$(dirname $(dirname $(find /usr/lib/jvm -name javac))) && \
    jlink --compress=2  --no-man-pages --no-header-files --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported --bind-services --output /jre

FROM buzzxu/alpine-glibc:latest     

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN apk update && apk upgrade && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 


ENV JAVA_VERSION 11.0.4
ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin