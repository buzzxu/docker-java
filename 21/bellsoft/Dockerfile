FROM bellsoft/liberica-openjre-debian:21 AS jre


FROM buzzxu/docker:debian

LABEL MAINTAINER buzzxu <downloadxu@163.com>


COPY --from=jre /usr/lib/jvm/jre /opt/jre/ 

    
ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 21
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"

