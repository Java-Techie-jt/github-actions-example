# Stage 1: Build the application
FROM maven:3.8.4 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Package the application into a smaller image
FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=build /app/target/springboot-images-new.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springboot-images-new.jar"]
