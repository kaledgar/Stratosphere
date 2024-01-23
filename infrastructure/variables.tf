variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "unique_prefix" {
  type    = string
  default = "kaledgar"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "server_name" {
  type    = string
  default = "Stratosphere"
}
