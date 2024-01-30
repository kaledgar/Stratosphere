FROM alpine:latest

# Set the working directory to /app
WORKDIR /app

# Download and install wget
RUN apk update \
    && apk add openjdk17-jre \
    && apk add bash \
    && apk add wget \
    && apk add jq

# Download PaperMC server file
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/398/downloads/paper-1.20.4-398.jar

# Change access permissions
RUN chmod 400 "paper-1.20.4-398.jar"

# Set eula.txt to true
RUN echo "eula=true" > eula.txt

# Run PaperMC server
CMD ["java", "-Xms3G", "-Xmx3G", "-jar", "paper-1.20.4-398.jar", "--nogui"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
