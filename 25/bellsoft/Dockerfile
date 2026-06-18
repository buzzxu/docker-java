FROM bellsoft/liberica-openjre-debian:25 AS jre


FROM buzzxu/docker:debian

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends tzdata openssl fontconfig libfontconfig1 ca-certificates && \
    update-ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /opt/jre && \
    chmod a+x /opt/jre && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

COPY fonts/ /usr/share/fonts/

RUN fc-cache -vf

COPY --from=jre /usr/lib/jvm/jre /opt/jre/


ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 25
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
