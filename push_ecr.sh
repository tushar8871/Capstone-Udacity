#!/usr/bin/env sh
set -e

REGION=us-east-1
ECR_URL=671761574982.dkr.ecr.us-east-1.amazonaws.com/capstone

# log docker into eks using aws cli
$(aws ecr get-login --no-include-email --region $REGION)
# build a docker image with a unique build number
docker build -t $ECR_URL  .

# push to ecr
docker push $ECR_URL

#tag for "latest" and also push that
docker tag $ECR_URL $ECR_URL:latest
docker push $ECR_URL:latest
