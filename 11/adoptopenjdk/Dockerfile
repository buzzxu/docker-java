FROM adoptopenjdk/openjdk11:debian AS jlink

RUN ["jlink", "--compress=2","--strip-debug", \
     "--no-header-files",\
     "--no-man-pages", \
     "--module-path", "/opt/java/openjdk/jmods", \
     "--add-modules", "java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported", \  
     "--bind-services",\ 
     "--output", "/jre"]

FROM debian:buster-slim

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN rm -rf /var/lib/apt/lists/* && \  
    apt-get clean && \
    apt-get update -qq && \ 
    apt-get upgrade -y && \
    apt-get install -qq -y --no-install-recommends openssl libfontconfig1 && \
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


ENV TZ Asia/Shanghai
ENV LANG C.UTF-8
ENV JAVA_VERSION 11
ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin
CMD ["jshell"]