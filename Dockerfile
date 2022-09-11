FROM maven:3.8.6-openjdk-11
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","./target/tawazun.war"]
