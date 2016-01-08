#!/bin/bash

# Script to push opsviz stack to ECR

# profile name in ~/.aws/credentials
AWS_PROFILE=

# AWS account number
AWS_ACCOUNT=

# EC2 Container Repository Namespace
ECR_NAMESPACE=

# Example commands:
#   aws --profile $AWS_PROFILE ecr create-repository --repository-name opsviz/doorman
#   docker build -t opsviz/rabbitmq-sensu sensu-client/
#   docker tag opsviz/doorman $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/opsviz/rabbitmq-sensu
#   docker push $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/opsviz/rabbitmq-sensu

for d in doorman grafana graphite logstash-server nginx-proxy rabbitmq redis-master sensu-api sensu-server sensu-client statsd uchiwa
do
  aws --profile $AWS_PROFILE ecr create-repository --repository-name $ECR_NAMESPACE/$d;
  docker build -t $ECR_NAMESPACE/$d $d/;
  docker tag $ECR_NAMESPACE/$d $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/$ECR_NAMESPACE/$d;
  docker push $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/$ECR_NAMESPACE/$d;
done
