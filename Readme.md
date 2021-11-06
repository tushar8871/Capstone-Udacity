[![CircleCI](https://circleci.com/gh/tushar8871/Capstone-Udacity/tree/master.svg?style=svg)](https://circleci.com/gh/tushar8871/Capstone-Udacity/tree/master)

# Cloud Devops Engineer Capstone -- Udacity

## About The Project

The project is a part from Udacity Nanodegree.
In this project, it is required to apply the skills and knowledge obtained from the program, which includes:
1. Worked with AWS
2. Used CircleCi to implement Continuous Integration and Continuous Deployment (CI/CD)
3. Built pipelines in CircleCi
4. Used Ansible and CloudFormation to deploy clusters
5. Built Kubernetes clusters (AWS EKS)
6. Built Docker Images in pipelines (Dockerhub)

The CI/CD pipeline for microservices applications is developed with `rolling deployment`. `Linting` is also done to check typographical errors. 

 ## Project Structure

| File/Folder | Description |
|:---- |:----------- |
| `.circleci` | Contains the config.yml where the build stages for this project are defined and a Makefile for cleaning up the environment. |
| `.circleci/cloudformation/netwrok` | Contains a Cloud Formation script for initializing the network infrastructure. |
| `.circleci/cloudformation/nodegroup` | Contains the EKS nodegroup configuration which will be used for setting up thenodes for cluster using cloudformation. |
| `.circleci/deployment/app` | Contains a deployment script which will be using docker image to create a pod in a cluster. |
| `Dockerfile` | Conatins a script by which one can create Docker image. |
| `Makefile` | Contains a script to run python application. |
| `app.py` | Contains an application code. |
| `requirements.txt` | Contains a prerequisties to run this application. |
| `run_docker.sh` | Contains a docker commands to build containerized image for this application. |
| `pus_ecr.sh` | Contains instructions to push image to AWS ECR(Elastic Container Registry) of this application. |
| `run_kuberenetes.sh` | Instructions to deploy application on the pods. |
| `post_test.sh` | Test application is susccessfully deployed or not. |
| `README.md` | This file you are actually reading. |

### Prerequisites

1. Create an AWS account
2. Create a CircleCi account and connect to your SCM.
3. Setup project by using Repostiory shown in Projects.
4. Create a [Docker](hub.docker.com) account.
5. EKS can be created manually by using the command below.
```
eksctl create cluster --name <cluster-name> --version 1.16 --nodegroup-name standard-workers --node-type t2.medium --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --region us-east-1
```
6. Setup the credentials in Circleci Project Settings for AWS credentials and dockerhub credentials

## Pipeline Stages

| Stage | Description |
|:---- |:----------- |
| `Setup Python Environment` | Sets up a virtual python environment for building the project. |
| `Install Dependencies` | Installs python dependencies. |
| `Lint Python` | Lints the application code. |
| `Lint Dockerfile` | Lints the Dockerfile. |
| `Build Docker` | Build a Docker container image and pushes it to DockerHub. |
| `Deploy to Kubernetes` | Deploys the newly created Docker image on the Kubernetes cluster. |
| `Rollout deployment` | Rollout deployment of application on the Kubernetes cluster. |
| `Post deployment testing` | Test will check your application successfully deployed or not. |