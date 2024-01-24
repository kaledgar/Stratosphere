locals {
  project_prefix = "${var.unique_prefix}-${var.aws_region}-${var.environment}"

  # default ami - Amazon Linux 2023
  ami_id        = "ami-0c45689cf7ad8a412"
  instance_type = "t2.medium"

  # default server_startup script filepath
  start_script_filepath = "../server_setup/server_setup.sh"
}
