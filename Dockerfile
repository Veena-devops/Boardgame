FROM maven AS maven
WORKDIR /build
COPY . .
RUN mvn clean package

FROM openjdk
WORKDIR /app
COPY --from=maven /build/target/app-0.1.0.jar app.jar
CMD ["java", "-jar", "app.jar"]
