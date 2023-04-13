[![CircleCI](https://dl.circleci.com/status-badge/img/gh/msagi/nd9991-c5-msagi-capstone/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/msagi/nd9991-c5-msagi-capstone/tree/main)
# CI / CD pipeline to deploy simple Flask microservice app to AWS EKS cluster using CircleCI

## Scope
Python Flask based microservices application dockerised and published to centralised image repository (Docker Hub), deployed to an AWS EKS cluster via CircleCI pipeline using EKS rolling deployment.

## Requirements
- [CircleCI](https://circleci.com/)
- [AWS](https://us-east-1.console.aws.amazon.com/) EKS (Kubernetes)
- [Docker Hub](https://hub.docker.com/)
- [msaginwm/devsecops-base:2023.04](https://hub.docker.com/repository/docker/msaginwm/devsecops-base/general) ([DevSecOps Docker image](https://github.com/msagi/devsecops-dockerimage))

## Install
- Download or clone this project
- Push this project to your GitHub repository
- Create a CricleCI account and set up the project (using the pipeline already defined in the [config.yml](.circleci/config.yml) file).
- Add the AWS credentials as environment variables. Configure `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION` as CircleCI project or context environment variables as shown in the links provided for [project](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project) or [context](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-context).

## Usage
- Run the Pipeline by pushing a new commit to the Git Hub repository or trigger the pipeline manually in the project’s GUI in CircleCI
- To access the application APIs, copy the Load Balancer URL to your browser

## Pipeline steps
- build-and-test: create a Python virtual environment then run hadolint (lint for Dockerfile) and pylint (lint for Python code).
- static-application-security-testing: run pip-audit (vulnerability scanning the application dependencies) and bandit (vulnerability scanning the application code).
- docker publish: dockerise the application and publish it to DockerHub.
- deploy-infrastructure: deploy AWS infrastructure via AWS CloudFormation (EKS cluster included).
- deploy-workload: deploy the application Docker image to the EKS cluster.
- smoke-test: get the service endpoint URL and run a smoke test on its health check API.

## Documentation
- [Architecture diagram](documentation/architecture-diagram.drawio)
- Screenshots about the CircleCI pipeline stages [screenshot1](documentation/SCREENSHOT-PIPELINE1.png) [screenshot2](documentation/SCREENSHOT-PIPELINE2.png)
- Screenshots for release v1.0.1
    - EKS Workload [screenshot1](documentation/SCREENSHOT-WORKLOAD-101-1.png) [screenshot2](documentation/SCREENSHOT-WORKLOAD-101-2.png) [screenshot3](documentation/SCREENSHOT-WORKLOAD-101-3.png)
    - EC2 instances [screenshot1](documentation/SCREENSHOT-EC2-INSTANCES-101-1.png) [screenshot2](documentation/SCREENSHOT-EC2-INSTANCES-101-2.png) [screenshot3](documentation/SCREENSHOT-EC2-INSTANCES-101-3.png) 
- Screenshots for release v1.0.2
    - EKS Workload [screenshot1](documentation/SCREENSHOT-WORKLOAD-102-1.png) [screenshot2](documentation/SCREENSHOT-WORKLOAD-102-2.png) [screenshot3](documentation/SCREENSHOT-WORKLOAD-102-3.png)
    - EKS Elastic Load Balancer URL - Service Status API response [screenshot1](documentation/SCREENSHOT-WORKLOAD-102-4.png) 
    - EC2 instances [screenshot1](documentation/SCREENSHOT-EC2-INSTANCES-102-1.png) [screenshot2](documentation/SCREENSHOT-EC2-INSTANCES-102-2.png) [screenshot3](documentation/SCREENSHOT-EC2-INSTANCES-102-3.png) 
