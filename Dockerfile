FROM openjdk:17-alpine

WORKDIR /app

COPY pom.xml .
COPY src src
COPY mvnw .
COPY .mvn .mvn

RUN chmod +x mvnw && ./mvnw clean package -DskipTests

RUN cp target/shopping-cart-application.jar /app/shopping-cart-application.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/shopping-cart-application.jar"]
