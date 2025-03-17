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
  ami               = local.aws_instance_ami
  instance_type     = local.aws_instance_type
  availability_zone = data.aws_availability_zones.available.names[var.az_index]
  key_name = aws_key_pair.tfkey.key_name
  vpc_security_group_ids = [aws_security_group.post_sg.id]
  subnet_id = aws_subnet.post_public_subnet.id

  tags = {
    Name = local.aws_instance_name
  }
}

resource "aws_key_pair" "tfkey" {
  key_name = local.aws_keypair_name
  public_key = file("tfkey.pub")
}