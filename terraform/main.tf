terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

module "vpc" {
  source = "./modules/vpc"
  aws_az = var.aws_az
}

module "security_group" {
  source = "./modules/security_group"
  aws_region = var.aws_region
  aws_vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  aws_region = var.aws_region
  aws_az = var.aws_az
  aws_ec2_instance_name = var.aws_ec2_instance_name
  aws_ec2_instance_type = var.aws_ec2_instance_type
  aws_ec2_ami = var.aws_ec2_ami
  subnet_id = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}
