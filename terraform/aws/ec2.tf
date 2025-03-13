terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terraform-backend" {
  ami           = "ami-08b5b3a93ed654d19" #amazon linux 
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
