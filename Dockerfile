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

     
