FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY ./target/photography-gateway-1-0.0.1-SNAPSHOT.jar ./

CMD ["java","-jar","photography-gateway-1-0.0.1-SNAPSHOT.jar"]
