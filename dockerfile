FROM maven:3.6.0-jdk-11-slim AS build

WORKDIR /app

COPY pom.xml /app/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "clean"]

COPY ["/src", "/app/src"]
RUN ["mvn", "package"]
EXPOSE 8080
CMD ["java", "-jar", "/tawazun.war"]