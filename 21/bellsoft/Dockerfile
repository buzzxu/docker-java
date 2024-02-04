FROM bellsoft/liberica-openjdk-debian:21 AS jlink
# jdir=$(dirname $(dirname $(find / -name javac)))
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends binutils && \
    jdir=$(dirname $(dirname $(find /usr/lib/jvm -name javac))) && \
    jlink --compress=2  --strip-debug --no-man-pages --no-header-files --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs --bind-services --output /jre


FROM buzzxu/docker:debian

LABEL MAINTAINER buzzxu <downloadxu@163.com>

COPY fonts/ /usr/share/fonts/

RUN rm -rf /var/lib/apt/lists/* && \  
    apt-get clean && \
    apt-get update -qq && \ 
    apt-get upgrade -y && \
    apt-get install -qq -y --no-install-recommends openssl fontconfig libfontconfig1 ca-certificates p11-kit && \
    update-ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    fc-cache -vf && \
    apt-get autoclean && \
    apt -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 

    
ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 21
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"

