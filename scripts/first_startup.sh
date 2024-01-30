#!/bin/bash

# update yum
sudo yum update

# install docker
sudo yum install docker -y

# start docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# directory with Dockerfile
mkdir /home/ec2-user/downloads


# scp -i deployer_key.pem Dockerfile ec2-user@3.249.46.239:/home/ec2-user/downloaded

# sudo docker build -t stratosphere-mc:1.0 .
# sudo ocker run -d -p 25565:25565 --name my-stratosphere stratosphere-mc:1.0

# get logs
# sudo docker logs my-stratosphere
