# modules/aws/main.tf

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
  region = var.aws_region
}

resource "aws_instance" "post_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = var.aws_az

  depends_on = [aws_internet_gateway.post_igw]

  tags = {
    Name = var.instance_name
  }
}
