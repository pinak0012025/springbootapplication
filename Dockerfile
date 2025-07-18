# Use full JDK, not Alpine
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy JAR file
COPY target/Shopping_Cart-0.0.1-SNAPSHOT.jar app.jar


# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
