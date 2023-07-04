# Stage 1: Build and test the Maven project
FROM maven:3.8.6-jdk-11-slim AS build
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src src/

# Build and test the Maven project
RUN mvn clean package

# Stage 2.
FROM openjdk:11-jre-slim

COPY --from=build app/target/*.jar .

CMD ["java", "-jar", "*.jar"]




