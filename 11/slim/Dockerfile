FROM openjdk:11.0.1-jre-slim

MAINTAINER buzzxu <downloadxu@163.com>

# 设置相应的时区
RUN rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
    echo "Asia/Shanghai" > /etc/timezone && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install -y locales vim && \
    locale-gen zh_CN.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive apt-get --purge remove -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    apt-get clean && \
    echo 'export TZ=Asia/Shanghai' >> /etc/profile \ 
    

ENV TZ='Asia/Shanghai'
# Default to UTF-8 file.encoding
ENV LANG zh_CN.UTF-8