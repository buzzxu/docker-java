FROM buzzxu/docker:debian AS jlink   

ARG JAVA_VERSION=21.0.1
ARG MINOR_VERSION=.0.1+12
ARG MINOR_VERSION$ =.0.1.12
ARG JAVA_TAR_FILE=Alibaba_Dragonwell_Standard_${JAVA_VERSION}${MINOR_VERSION$}_x64_linux.tar.gz
ENV JAVA_HOME=/usr/local/jdk-${JAVA_VERSION}
RUN set -eux; \
    cd /tmp && \
    apt-get update; \
    apt-get install -y --no-install-recommends wget binutils && \
    wget --no-check-certificate -c "https://github.com/dragonwell-project/dragonwell21/releases/download/dragonwell-standard-${JAVA_VERSION}${MINOR_VERSION}_jdk-${JAVA_VERSION}-ga/${JAVA_TAR_FILE}" && \
    mkdir -p "$JAVA_HOME" && \
    tar --extract --file ${JAVA_TAR_FILE} --directory "$JAVA_HOME" --strip-components 1 && \
    echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile && \
    echo "PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile && \
    echo "export PATH JAVA_HOME" >> /etc/profile && \
    /bin/bash -c "source /etc/profile" && \
    jdir=$(dirname $(dirname $(find / -name javac))) && \
    $JAVA_HOME/bin/jlink --compress=2  --no-man-pages --no-header-files --strip-debug --module-path ${jdir}/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs --bind-services --output /jre  

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
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

COPY --from=jlink /jre /opt/jre/ 
    

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 21
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"