###


#### export jre 
```
RUN ["jlink", "--compress=2","--strip-debug", \
     "--no-man-pages", \
     "--module-path", "/opt/java/openjdk/jmods", \
     "--add-modules", "java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported", \  
     "--bind-services",\ 
     "--output", "/jre"]
```

#### test jre
```
./jlink --compress=2 --strip-debug  --no-man-pages --module-path /opt/java/openjdk/jmods  --add-modules java.base,java.desktop,java.instrument,java.logging,java.management,java.net.http,java.naming,java.rmi,java.security.jgss,java.sql,java.sql.rowset,java.xml,jdk.unsupported --bind-services --output /jre
```