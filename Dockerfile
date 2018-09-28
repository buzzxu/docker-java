FROM frolvlad/alpine-glibc

MAINTAINER buzzxu <downloadxu@163.com>

ENV LANG C.UTF-8
# 设置相应的时区
RUN apk update && apk upgrade && \
    apk add --no-cache ca-certificates tzdata  wget vim && \
    update-ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    rm -rf /var/cache/apk 

RUN wget "https://www.archlinux.org/packages/core/x86_64/zlib/download" -O /tmp/libz.tar.xz \
    && mkdir -p /tmp/libz \
    && tar -xf /tmp/libz.tar.xz -C /tmp/libz \
    && cp /tmp/libz/usr/lib/libz.so.1.2.11 /usr/glibc-compat/lib \
    && /usr/glibc-compat/sbin/ldconfig \
    && rm -rf /tmp/libz /tmp/libz.tar.xz

RUN ZULU_ARCH=zulu11.1+23-ea-jdk11-linux_x64.tar.gz && \
	INSTALL_DIR=/usr/local/jvm && \
	BIN_DIR=/usr/bin && \
	MAN_DIR=/usr/share/man/man1 && \
	ZULU_DIR=$( basename ${ZULU_ARCH} .tar.gz ) && \
	wget -q http://cdn.azul.com/zulu/bin/${ZULU_ARCH} && \
    apk del wget && \
    rm /root/.wget-hsts && \
    mkdir -p ${INSTALL_DIR} && \
	tar -xf ./${ZULU_ARCH} -C ${INSTALL_DIR} && rm -f ${ZULU_ARCH} && \
	cd ${BIN_DIR} && find ${INSTALL_DIR}/${ZULU_DIR}/bin -type f -perm -a=x -exec ln -s {} . \; && \
	mkdir -p ${MAN_DIR} && \
	cd ${MAN_DIR} && find ${INSTALL_DIR}/${ZULU_DIR}/man/man1 -type f -name "*.1" -exec ln -s {} . \; && \
    ln -svT ${INSTALL_DIR}/${ZULU_DIR} /java-home && \
	java -version 
RUN apk del ca-certificates 

ENV JAVA_HOME /java-home
ENV PATH $PATH:$JAVA_HOME/bin
ENV JAVA_VERSION 11-ea+22