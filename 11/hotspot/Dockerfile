FROM adoptopenjdk/openjdk11:alpine AS jlink

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN ["jlink", "--compress=2", \
     "--module-path", "/opt/java/openjdk/jmods", \
     "--add-modules", "java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.xml,jdk.unsupported", \  
     "--bind-services",\ 
     "--output", "/jre"]  

FROM frolvlad/alpine-glibc:alpine-3.8_glibc-2.28     

RUN apk update && apk upgrade && \
    apk add --no-cache -U binutils tzdata wget && \
    rm /etc/localtime && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    wget "https://www.archlinux.org/packages/core/x86_64/zlib/download" -O /tmp/libz.tar.xz && \
    mkdir -p /tmp/libz && \
    tar -xf /tmp/libz.tar.xz -C /tmp/libz && \
    cp /tmp/libz/usr/lib/libz* /usr/glibc-compat/lib && \
    strip /usr/glibc-compat/lib/libz.so.* &&\
    /usr/glibc-compat/sbin/ldconfig && \
    rm -rf /tmp/libz /tmp/libz.tar.xz && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    ln -svT /opt/jre /java-home && \
    apk del wget curl binutils && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 


ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
ENV JAVA_VERSION 11.0.1
ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin