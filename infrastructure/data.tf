data "aws_instance" "server_instance" {
  instance_id = module.ec2_instance.id
}



resource "local_file" "start_setup_script" {
  filename = "../server_setup/server_setup.sh"

  content = templatefile("../server_setup/server_setup_template.tfpl",
    {
      var_deployer_key     = "deployer_key.pem"
      var_server_public_ip = data.aws_instance.server_instance.public_ip
    }
  )

  file_permission = "0400"

  depends_on = [data.aws_instance.server_instance]
}

