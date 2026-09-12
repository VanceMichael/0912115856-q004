FROM eclipse-temurin:21-jdk AS build
WORKDIR /src
COPY . .
RUN sh ./mvnw -q -DskipTests package
FROM eclipse-temurin:21-jre
COPY --from=build /src/target/app.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
