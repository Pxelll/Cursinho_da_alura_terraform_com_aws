terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "name" {
  ami = "ami-0261755bbcb8c4a84"
  instance_type = "t2.micro"
  tags = {
    Name = "Alura_Terraform"
  }
}