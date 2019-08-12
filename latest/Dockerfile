FROM buzzxu/alpine-glibc:latest  AS jlink   

ARG JAVA_VERSION=jdk-12.0.2
ARG JAVA_TAR_FILE=${JAVA_VERSION}_linux-x64_bin.tar.gz
ENV JAVA_HOME=/usr/local/${JAVA_VERSION}

RUN cd /tmp && \
    apk add wget tar gzip && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/12.0.2+10/e482c34c86bd4bf8b56c0b35558996b9/${JAVA_TAR_FILE}" && \
    tar zxvf ${JAVA_TAR_FILE} -C /usr/local && \
    echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile && \
    echo "PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile && \
    echo "export PATH JAVA_HOME" >> /etc/profile && \
    source /etc/profile && \
    jdir=$(dirname $(dirname $(find / -name javac))) && \
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
    
ENV JAVA_HOME /java-home
ENV JAVA_VERSION 12
ENV PATH $PATH:$JAVA_HOME/bin      



