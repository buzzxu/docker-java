FROM eclipse-temurin:25-jre-alpine

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN apk add --no-cache -U tzdata font-adobe-100dpi fontconfig ttf-dejavu && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    rm -rf /opt/jre /java-home && \
    ln -s /opt/java/openjdk /opt/jre && \
    chmod a+x /opt/jre && \
    ln -s /opt/jre /java-home && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

COPY fonts/ /usr/share/fonts/

RUN fc-cache -vf

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 25
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
