[![CircleCI](https://dl.circleci.com/status-badge/img/gh/msagi/nd9991-c5-msagi-capstone/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/msagi/nd9991-c5-msagi-capstone/tree/main)
# Capstone - Cloud DevOps

## Scope
Python Flask based microservices application dockerised and publish to centralised image repository (DockerHub), deployed to an AWS EKS cluster via CircleCI pipeline using rolling deployment.

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
