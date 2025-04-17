#!/bin/bash

# Exit script on error
set -e

# Step 1: Install dnf-plugins-core
echo "Installing dnf-plugins-core..."
sudo dnf -y install dnf-plugins-core

# Step 2: Add Docker's official repository
echo "Adding Docker's official repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Step 3: Install Docker Engine and related packages
echo "Installing Docker Engine, CLI, and plugins..."
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and start Docker service
echo "Enabling and starting Docker service..."
sudo systemctl enable --now docker

# Verify Docker installation
echo "Verifying Docker installation..."
sudo docker --version
echo "Docker installation completed successfully!"
