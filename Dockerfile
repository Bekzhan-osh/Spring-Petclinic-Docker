FROM openjdk:8
LABEL maintainer="bek@kamalov2020.com"
COPY . /petclinic/
WORKDIR /petclinic/
RUN ./mvnw package   
CMD ["java", "-jar", "target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar"]
EXPOSE 8080
