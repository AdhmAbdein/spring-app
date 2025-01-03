FROM openjdk:17-alpine

WORKDIR /app

# Copy the necessary files for the build
COPY pom.xml .
COPY src src
COPY mvnw .
COPY .mvn .mvn

# Build the application
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Copy the application JAR file from the target directory to /app
RUN cp target/Shopping_Cart-0.0.1-SNAPSHOT.jar /app/Shopping_Cart-0.0.1-SNAPSHOT.jar

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/Shopping_Cart-0.0.1-SNAPSHOT.jar"]
