# main.tf
module "aws" {
  source        = "./modules/aws"
  aws_region = var.aws_region
  aws_az = var.aws_az
  aws_vpc_cidr_block = var.aws_vpc_cidr_block
  aws_public_subnet_cidr_block = var.aws_public_subnet_cidr_block
  aws_private_subnet_cidr_block = var.aws_private_subnet_cidr_block
}

module "docker_container" {
  source          = "./modules/docker"
  docker_password = var.db_password
  db_name         = var.db_name
  db_user         = var.db_user
  db_password     = var.docker_password
  docker_username = var.docker_username
  docker_port     = var.docker_port
}