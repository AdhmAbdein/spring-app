FROM openjdk:17-alpine

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

RUN cp .mvn/wrapper/maven-wrapper.jar /app/maven-wrapper.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/maven-wrapper.jar"]


