# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the local .jar file to the container's /app directory
COPY /var/lib/jenkins/workspace/cicd-pipeline/target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar

# Expose the port that the application will run on (optional)
EXPOSE 8080

# Run the .jar file when the container starts
ENTRYPOINT ["java", "-jar", "your-app.jar"]

     
