## Description

<p align="center">
  <img src="misc/s3_to_lambda.png" />
</p>

This code contains generic template for AWS Lambda function that can be triggered by a PUT event that comes from a specified and expected file uploaded to s3 bucket.

## Prerequisites

### Required

- **aws-cli ~ 2.13:** Configured and connected with AWS.
- **terraform ~ 1.6:** Installed and connected with AWS.
- **AWS User:** Ensure the AWS user has the necessary policies for creating and reading resources such as Lambda, S3, IAM, and DynamoDB.

## Deploy

### Automated cloud infrastructure deployment

Contains submodule with s3 bucket & dynamodb table for remote backend :)
```shell
sh deploy_remote.sh
```

### Destroy All Resources
```shell
sh destroy_infrastructure.sh
```

### Pre commit
```
pre-commit install
```
