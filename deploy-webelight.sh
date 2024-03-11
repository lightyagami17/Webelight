#!/bin/bash

# Go to the current working directory
cd /home/ec2-user/Webelight

# Stop the current containers and images
docker-compose down -v

# Pull the latest code
git pull origin main

# Build and Deploy the latest code
docker-compose build
docker-compose up -d
