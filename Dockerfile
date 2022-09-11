FROM maven:3.6.3-openjdk-11 AS build
LABEL author="Hanan alqarni"
WORKDIR /app

COPY pom.xml /app/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "clean"]
COPY ["src/main", "/app/src/main"]
RUN ["mvn", "package"]

FROM openjdk:11-jre

COPY --from=build /app/target/tawazun.war /

EXPOSE 8080
CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-war", "/tawazun.war"]