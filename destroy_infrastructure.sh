#!/bin/bash

# remove key and rendered scripts
rm -rf scripts/deployer_key.pem
rm -rf scripts/connect_ssh.sh

# no -auto-approve in case of accidental destruction :)
cd infrastructure/
terraform destroy -lock=false
wait $!

cd remote_state/
terraform destroy -lock=false
wait $!

