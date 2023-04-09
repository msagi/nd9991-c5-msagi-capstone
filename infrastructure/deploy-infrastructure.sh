#!/usr/bin/env bash
set -o xtrace

stackName="msagi-capstone-stack"
if [ -n "$1" ]; then
    $stackName=$1
fi

aws cloudformation deploy \
    --stack-name ${stackName} \
    --template-file amazon-eks-vpc-private-subnets.yaml \
    --parameter-overrides file://amazon-eks-vpc-private-subnets-parameters.json \
    --region "us-east-1" \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"