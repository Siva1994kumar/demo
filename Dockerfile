
   # Step 1: Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and any necessary files for Maven
COPY pom.xml .

# Download and cache the Maven dependencies
RUN mvn dependency:go-offline

# Copy the rest of the application code into the container
COPY src /app/src

# Build the application (this will create the JAR file)
RUN mvn clean package -DskipTests

# Step 2: Create the runtime image
FROM openjdk:17-slim

# Set the working directory inside the runtime container
WORKDIR /app

# Copy the JAR file from the build stage into the runtime container
COPY --from=build /app/target/*.jar app.jar

# Set the default command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

# Expose the port your application will run on (optional, depending on your application)
EXPOSE 8080
  
