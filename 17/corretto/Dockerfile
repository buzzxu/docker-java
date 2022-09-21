FROM amazoncorretto:17 AS jlink

RUN jdir=$(dirname $(dirname $(find /usr/lib/jvm -name javac))) && \
    jlink --compress=2  --no-man-pages --no-header-files --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.incubator.foreign,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs --bind-services --output /jre

FROM debian:bullseye-slim   

LABEL MAINTAINER buzzxu <downloadxu@163.com>

COPY fonts/ /usr/share/fonts/

RUN rm -rf /var/lib/apt/lists/* && \  
    apt-get clean && \
    apt-get update -qq && \ 
    apt-get upgrade -y && \
    apt-get install -qq -y --no-install-recommends openssl fontconfig libfontconfig1 ca-certificates && \
    update-ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    fc-cache -vf && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 


ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 17
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"