#!/bin/bash

# Initialize Terraform + deploy resources for remote backend (s3+dynamodb)
cd infrastructure/remote_state/
terraform init
wait $!
terraform apply -auto-approve
wait $!

: '
This sleep is because of common error:

Error refreshing state: state data in S3 does not have the expected content.
This may be caused by unusually long delays in S3 processing a previous state
update.  Please wait for a minute or two and try again. If this problem
persists, and neither S3 nor DynamoDB are experiencing an outage, you may need
to manually verify the remote state and update the Digest value stored in the
DynamoDB table to the following value: 
'

sleep 1m

# Initialize Terraform in /infrastructure with the updated backend configuration
cd ..
terraform init
wait $!
terraform apply -auto-approve
wait $!

echo 'Succesfully Deployed All Resources'

rm ../lambda/lambda.zip
echo 'Deleted lambda.zip'