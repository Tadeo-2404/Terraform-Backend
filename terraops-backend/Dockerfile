FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /workspace/app
COPY . .
RUN ["mvn", "clean", "package", "-DskipTests"]