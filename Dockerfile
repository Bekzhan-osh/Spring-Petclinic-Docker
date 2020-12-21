FROM maven:3.6.3-jdk-8 AS build-env
LABEL maintainer="bek@kamalov2020.com"
WORKDIR /spring

COPY pom.xml ./
RUN mvn dependency:go-offline
RUN mvn spring-javaformat:help

COPY . ./
RUN mvn spring-javaformat:apply
RUN mvn package -DfinalName=petclinic

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /spring

COPY --from=build-env /spring/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar ./petclinic.jar
CMD ["java", "-jar", "petclinic.jar"]


