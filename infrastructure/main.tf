provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.6.4"
  backend "s3" {
    bucket         = "terraform-state-bucket-kaledgar"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
  }
}
