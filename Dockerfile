FROM maven:3.6.0-jdk-11-slim AS build
LABEL author="Hanan alqarni"
WORKDIR /app

EXPOSE 8080

COPY pom.xml /app/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "clean"]
COPY ["/src", "/app/src"]
RUN ["mvn", "package"]

FROM openjdk:11-jre-slim

COPY --from=build /app/target/tawazun.war /

CMD ["java", "-jar", "target/tawazun.war"]
