FROM adoptopenjdk/openjdk11-openj9:alpine  AS jlink

RUN ["jlink", "--compress=2","--strip-debug", \
     "--no-header-files",\
     "--no-man-pages", \
     "--module-path", "/opt/java/openjdk/jmods", \
     "--add-modules", "java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported", \  
     "--bind-services",\ 
     "--output", "/jre"]  

FROM frolvlad/alpine-glibc:alpine-3.9_glibc-2.29     

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN apk update && apk upgrade && \
    apk add --no-cache -U ca-certificates tzdata&& \
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
ENV JAVA_VERSION 11.0.2
ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport"