FROM maven:3.9.6-amazoncorretto-17 as builder
WORKDIR /usr/home/app
COPY pom.xml ./
COPY src ./src
RUN mvn clean install

FROM eclipse-temurin:17-jdk-alpine
ENV JAVA_OPTS ''
COPY --from=builder /usr/home/app/target/*.jar app.jar
EXPOSE 80
ENTRYPOINT ["sh", "-c", "java  $JAVA_OPTS -jar /app.jar"]
