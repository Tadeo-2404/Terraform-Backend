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

  depends_on = [aws_internet_gateway.post_igw]

  tags = {
    Name = local.aws_instance_name
  }
}
