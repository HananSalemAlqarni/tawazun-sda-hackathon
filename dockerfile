FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY target/login-0.0.1-SNAPSHOT.jar tawazon.jar
EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar tawazon.jar