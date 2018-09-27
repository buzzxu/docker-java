FROM frolvlad/alpine-glibc:latest

MAINTAINER buzzxu <downloadxu@163.com>

# 设置相应的时区
RUN apk update && apk upgrade && \
    apk add --no-cache ca-certificates tzdata  wget && \
    update-ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata 
RUN apk add vim

RUN wget "https://www.archlinux.org/packages/core/x86_64/zlib/download" -O /tmp/libz.tar.xz \
    && mkdir -p /tmp/libz \
    && tar -xf /tmp/libz.tar.xz -C /tmp/libz \
    && cp /tmp/libz/usr/lib/libz.so.1.2.11 /usr/glibc-compat/lib \
    && /usr/glibc-compat/sbin/ldconfig \
    && rm -rf /tmp/libz /tmp/libz.tar.xz

RUN ZULU_ARCH=zulu11.1+23-ea-jdk11-linux_x64.tar.gz && \
	INSTALL_DIR=/usr/local/java && \
	BIN_DIR=/usr/bin && \
	MAN_DIR=/usr/share/man/man1 && \
	ZULU_DIR=$( basename ${ZULU_ARCH} .tar.gz ) && \
	wget -q http://cdn.azul.com/zulu/bin/${ZULU_ARCH} && \
    apk del wget && \
	tar -xf ./${ZULU_ARCH} -C /usr/local/ && rm -f ${ZULU_ARCH} && \
    mv /usr/local/${ZULU_DIR} ${INSTALL_DIR} && \
	cd ${BIN_DIR}; find ${INSTALL_DIR}/bin -type f -perm -a=x -exec ln -s {} . \; && \
	mkdir -p ${MAN_DIR} && \
	cd ${MAN_DIR}; find ${INSTALL_DIR}/man/man1 -type f -name "*.1" -exec ln -s {} . \; 

ENV JAVA_HOME /usr/local/java
ENV PATH $PATH:$JAVA_HOME/bin
ENV JAVA_VERSION 11-ea+22