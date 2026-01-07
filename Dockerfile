# -------- Stage 1: Build the application --------
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copy all project files into container
COPY . .

# Run Maven build to generate the jar
RUN mvn clean package -DskipTests

# -------- Stage 2: Run the application --------
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the jar produced in stage 1
COPY --from=build /app/target/Shopping_Cart-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
