# docker-java

## Supported Images

### Java 21

Variants:

- `21`
- `21-openjdk`
- `21-zulu`
- `21-bellsoft`
- `21-alpine`
- `21-openj9`
- `21-dragonwell`

Modules:

```text
java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs,jdk.localedata,jdk.charsets,jdk.crypto.ec
```

### Java 25

Variants:

- `25`
- `25-zulu`
- `25-bellsoft`
- `25-alpine`
- `25-openj9`
- `25-dragonwell`

Modules:

```text
java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.jsobject,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs,jdk.localedata,jdk.charsets,jdk.crypto.ec
```

### Latest

`latest` currently builds Oracle Java 26.

Modules:

```text
java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported,java.scripting,jdk.dynalink,jdk.jdwp.agent,jdk.net,jdk.nio.mapmode,jdk.sctp,jdk.xml.dom,jdk.zipfs,jdk.localedata,jdk.charsets,jdk.crypto.cryptoki
```

### Env

```shell
ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'
ENV JAVA_VERSION 25
ENV JAVA_HOME=/opt/jre \
    PATH="/opt/jre/bin:$PATH"
```
