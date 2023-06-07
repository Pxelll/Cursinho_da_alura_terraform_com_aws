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

resource "aws_instance" "maquina_virtual" {
  ami = "ami-0261755bbcb8c4a84"
  instance_type = "t2.micro"
  key_name = "terraform_alura"
  #Esses comandos vão ser executados da mesma forma que um script seria executado, então é interessante começarmos com #!/bin/bash para identificar com qual tipo de console queremos executá-lo.
  user_data = <<-EOF
                 #!/bin/bash
                 cd /home/ubuntu
                 echo "<h1>Feito com terraform</h1>" > index.html
                 nohup busybox httpd -f -p 8080 &
                 EOF
  tags = {
    Name = "Alura_Terraform"
  }
}