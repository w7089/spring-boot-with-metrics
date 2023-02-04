FROM maven:3.8.6-openjdk-11-slim as builder
WORKDIR /
COPY src /src
COPY pom.xml /pom.xml
RUN mvn package

FROM openjdk:11-jre
WORKDIR /
COPY --from=0 /target/spring-boot-with-metrics-1.0.0-SNAPSHOT.jar /spring-boot-with-metrics-1.0.0-SNAPSHOT.jar
CMD ["java", "-jar", "/spring-boot-with-metrics-1.0.0-SNAPSHOT.jar"]
