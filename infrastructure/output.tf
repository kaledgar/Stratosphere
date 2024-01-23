##################################
##------Get-server-public-ip------
##################################

output "instance_public_ip" {
  description = "The public ip for ssh access"
  value       = data.aws_instance.server_instance.public_ip
}

