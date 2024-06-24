#!/bin/bash

sudo yum update

# Docker
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker

# Add ec2-user to the docker group
sudo usermod -aG docker ec2-user