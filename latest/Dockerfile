FROM buzzxu/alpine-glibc:latest  AS jlink   

ARG JAVA_VERSION=14.0.1
ARG JAVA_TAR_FILE=jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz
ENV JAVA_HOME=/usr/local/jdk-${JAVA_VERSION}

RUN cd /tmp && \
    apk add wget tar gzip && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+7/664493ef4a6946b186ff29eb326336a2/${JAVA_TAR_FILE}" && \
    tar zxvf ${JAVA_TAR_FILE} -C /usr/local && \
    echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile && \
    echo "PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile && \
    echo "export PATH JAVA_HOME" >> /etc/profile && \
    source /etc/profile && \
    jdir=$(dirname $(dirname $(find / -name javac))) && \
    jlink --compress=2  --no-man-pages --no-header-files --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported --bind-services --output /jre  

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
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 
    

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 14
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
CMD ["jshell"]



