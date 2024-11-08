#!/bin/bash
# Update the package repository and install Docker
sudo apt update -y
sudo apt install -y docker.io
sudo chown $USER /var/run/docker.sock

# Start Docker service
# sudo service docker start

# Add current user to the docker group
# sudo usermod -aG docker ubuntu

# Install Docker Compose (latest version)
sudo apt install docker-compose

# Install AWS CLI to download files from S3
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Set up application directory
APP_DIR="/home/ubuntu/two-tier-flask-app-deploy"
mkdir -p "$APP_DIR"
cd "$APP_DIR"

# Download application files from S3
aws s3 cp s3://flask-app-deployment-demo/docker-compose.yml .
aws s3 cp s3://flask-app-deployment-demo/app.py .
aws s3 cp s3://flask-app-deployment-demo/index.html .
aws s3 cp s3://flask-app-deployment-demo/message.sql .
aws s3 cp s3://flask-app-deployment-demo/Dockerfile .

sudo docker build . -t flaskapp

# Start the Docker Compose application
sudo docker-compose up -d
