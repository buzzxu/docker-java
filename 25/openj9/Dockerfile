FROM ibm-semeru-runtimes:open-25-jre-noble

LABEL MAINTAINER buzzxu <downloadxu@163.com>

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends tzdata openssl fontconfig libfontconfig1 ca-certificates && \
    update-ca-certificates && \
    rm /etc/localtime && \
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    ln -sfnT /opt/java/openjdk /opt/jre && \
    mkdir -p /opt/java/.scc && \
    chmod a+x /opt/jre && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

COPY fonts/ /usr/share/fonts/

RUN fc-cache -vf

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 25
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+PortableSharedCache -XX:+IdleTuningGcOnIdle -Xshareclasses:name=openj9_system_scc,cacheDir=/opt/java/.scc,readonly,nonFatal"
