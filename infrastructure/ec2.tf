module "ec2_instance" {
  # Anton Babenko is great <3
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "~>3.0"
  name          = var.server_name
  instance_type = local.instance_type
  ami           = local.ami_id

  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.webtraffic.id]
  subnet_id              = aws_subnet.main_subnet_a.id

  tags = {
    terraform   = "True"
    environment = "dev"
  }
}

# RSA KEY PAIR

resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = "deployer-key"
}


