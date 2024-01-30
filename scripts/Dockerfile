# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the working directory to /app
WORKDIR /app

# Download and install wget
RUN apk add --no-cache wget

# Download PaperMC server file
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/398/downloads/paper-1.20.4-398.jar

# Change access permissions
RUN chmod 400 "paper-1.20.4-398.jar"

# Set eula.txt to true
RUN echo "eula=true" > eula.txt

# Run PaperMC server
CMD ["java", "-Xms3G", "-Xmx3G", "-jar", "paper-1.20.4-398.jar", "--nogui"]
