FROM openjdk:17-slim-buster AS jlink

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends binutils && \
    jdir=$(dirname $(dirname $(find / -name javac))) && \
    jlink --compress=2  --no-man-pages --no-header-files --strip-debug --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.incubator.foreign,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp --bind-services --output /jre


FROM debian:buster-slim 

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN rm -rf /var/lib/apt/lists/* && \  
    apt-get clean && \
    apt-get update -qq && \ 
    apt-get upgrade -y && \
    apt-get install -qq -y --no-install-recommends openssl libfontconfig1 ca-certificates p11-kit && \
    update-ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 
    
ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 16
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"

