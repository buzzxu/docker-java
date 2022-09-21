# docker-java

## Modules

### 17
java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.incubator.foreign,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs
```
```
### 19

```
java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs,jdk.incubator.concurrent,jdk.incubator.vector
```

### Env

``` shell
ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 17
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
```