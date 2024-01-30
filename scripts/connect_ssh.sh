# set key file permission
chmod 400 "deployer_key.pem"

# connect with server using key via ssh
ssh -i "deployer_key.pem" ec2-user@3.252.245.155