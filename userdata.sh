#!/bin/bash
set -e

# Update system
apt-get update -y

# Install Docker
apt-get install -y docker.io
usermod -aG docker ubuntu

# Start & enable Docker
systemctl enable docker
systemctl start docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Git
apt-get install -y git




