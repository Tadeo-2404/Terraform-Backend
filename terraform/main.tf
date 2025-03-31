terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.93.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
  aws_az = var.aws_az
}

module "security_group" {
  source     = "./modules/security_group"
  aws_region = var.aws_region
  aws_vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  aws_region        = var.aws_region
  aws_az            = var.aws_az
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.ec2_sg_id
}


module "rds" {
  source                 = "./modules/rds"
  db_subnet_group_name   = module.vpc.private_subnet_group_pg_name
  vpc_security_group_ids = module.security_group.postgres_sg_id
  db_username            = var.db_username
  db_password            = var.db_password
}