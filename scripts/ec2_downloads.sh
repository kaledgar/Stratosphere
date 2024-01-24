#!/bin/bash

sudo yum update

sudo yum install java

wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/398/downloads/paper-1.20.4-398.jar

chmod 400 "paper-1.20.4-398.jar"
java -Xms3G -Xmx3G -jar paper-1.20.4-398.jar --nogui

# set eula to true
