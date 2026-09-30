terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#variables
variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t2.micro"
}


#provider
provider "aws" {
  region = var.region
}

#resource
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1d0"
  instance_type = var.instance_type
}

#output
output "instance_id" {
  value = aws_instance.web.id
}