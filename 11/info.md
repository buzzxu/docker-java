###

```
RUN ["jlink", "--compress=2", \
     "--module-path", "/opt/java/openjdk/jmods", \
     "--add-modules", "java.base,java.desktop,java.instrument,java.logging,java.management,java.naming,java.rmi,java.security.jgss,java.sql,java.xml,jdk.unsupported", \  
     "--bind-services",\ 
     "--output", "/jre"]
```



```
./jlink --compress=2 --module-path .\jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.naming,java.rmi,java.security.jgss,java.sql,java.xml,jdk.unsupported --bind-services --output /Users/xux/jre
```

```
./jlink --compress=2 --module-path /opt/java/openjdk/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.naming,java.rmi,java.security.jgss,java.sql,java.xml,jdk.unsupported --bind-services --output /jre
```