#!/bin/bash

# update yum
sudo yum update
sudo yum install java -y

# download papermc server file
wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/398/downloads/paper-1.20.4-398.jar

# change access
chmod 400 "paper-1.20.4-398.jar"

# run papermc minecraft server 
java -Xms3G -Xmx3G -jar paper-1.20.4-398.jar --nogui
wait $!

# set eula.txt to true

# Define the file path to eula
file_path="./eula.txt"

# Check if the file exists
if [ -e "$file_path" ]; then
    # Use sed to replace 'eula=false' with 'eula=true'
    sed -i 's/eula=false/eula=true/' "$file_path"
    echo "EULA has been updated to true."
else
    echo "Error: File not found at $file_path."
fi

# Run server
java -Xms3G -Xmx3G -jar paper-1.20.4-398.jar --nogui