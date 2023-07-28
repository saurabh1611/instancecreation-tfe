terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#provider "vault" {
#  address = "http://3.133.92.151:8200"
#}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
#  access_key = data.vault_aws_access_credentials.aws.access_key
#  secret_key = data.vault_aws_access_credentials.aws.secret_key
#  token      = data.vault_aws_access_credentials.aws.security_token
   access_key = var.AWS_ACCESS_KEY
   secret_key = var.AWS_SECRET_KEY
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

#data "vault_aws_access_credentials" "aws" {
#  backend = "aws"
#  role    = "my-ec2-role"
#}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
