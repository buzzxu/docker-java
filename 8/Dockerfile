FROM azul/zulu-openjdk-debian:8 AS jdk

FROM debian:buster-slim

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

COPY --from=jdk /usr/lib/jvm /opt/jre/ 


ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 11
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"

