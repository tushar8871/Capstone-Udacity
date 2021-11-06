#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
aws ecr get-login-password --region us-east-1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f ./.circleci/deployment/app.yml
#kubectl apply -f ./.circleci/deployment/loadbalancer.yml

echo "Pause Time 10 seconds"
sleep 10
echo "Continuing......."
# Step 3:
# List kubernetes pods
kubectl get pods

