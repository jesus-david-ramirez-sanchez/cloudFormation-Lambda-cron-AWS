#!/bin/bash

aws cloudformation package --template-file lambdaTemplate.yaml --s3-bucket mipaquete-cfn-templates --output-template-file packaged.yaml
aws cloudformation deploy --template-file ../lambdaTemplate.yaml --stack-name mpr-reDeployment --tags project=mpr --capabilities CAPABILITY_NAMED_IAM --parameter-overrides \
    EnvType=env \
    ExecuteTime="rate(2 minutes)" \
    ExecuteName=name \
    conectionDB=conection 
aws cloudformation update-termination-protection --stack-name mpr-reDeployment --enable-termination-protection