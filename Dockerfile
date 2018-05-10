FROM node:carbon

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/i2-connect-server/i2-connect-server-1.0-SNAPSHOT.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib           /usr/share/i2-connect-server/lib
# Add the service itself
ADD target/i2-connect-server-1.0-SNAPSHOT.jar /usr/share/i2-connect-server/i2-connect-server-1.0-SNAPSHOT.jar
