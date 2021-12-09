#!/bin/sh

echo "Retrieve an authentication token and authenticate your Docker client to your registry:"
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 899955854446.dkr.ecr.us-west-2.amazonaws.com

echo "Build docker image:"
docker build -t react_app .

echo "Tag image to push to ECR repository:"
docker tag react_app:latest 899955854446.dkr.ecr.us-west-2.amazonaws.com/react_app:latest

echo "Push image to newly created ECR repository:"
docker push 899955854446.dkr.ecr.us-west-2.amazonaws.com/react_app:latest

echo "Update ECS cluster:"
aws ecs update-service --cluster react-cluster --service react-sv --force-new-deployment --no-cli-pager

echo "Successful!"