locals {
  project_prefix = "${var.unique_prefix}-${var.aws_region}-${var.environment}"

  # default ami - Amazon Linux 2023
  ami_id        = "ami-0c45689cf7ad8a412"
  instance_type = "t2.medium"

  # filepaths
  connect_ssh_script_filepath   = "../scripts/connect_ssh.sh"
  first_startup_script_filepath = "../scripts/first_startup.sh"
  rsa_key_filepath              = "../scripts/deployer_key.pem"
}
