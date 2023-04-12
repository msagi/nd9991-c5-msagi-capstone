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

