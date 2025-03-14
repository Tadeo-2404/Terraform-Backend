variable "instance_name" {
  default = "post-ec2"
  type        = string
  description = "instance_name"
}

variable "aws_region" {
  default = "us-east-1"
  type        = string
  description = "aws_region"
}

variable "instance_type" {
  default = "t2.micro"
  type        = string
  description = "instance_type"
}

variable "ami" {
  default = "ami-08b5b3a93ed654d19"
  type        = string
  description = "ami"
}

//VPC
variable "aws_vpc_name" {
  default = "post_vpc"
  type        = string
  description = "aws_vpc_name"
}

variable "aws_vpc_cidr_block" {
  default = "192.168.100.0/24"
  type        = string
  description = "aws_vpc_cidr_block"
}

//SUBNETS
variable "aws_public_subnet_name" {
  default = "post_public_subnet"
  type        = string
  description = "aws_public_subnet_name"
}

variable "aws_public_subnet_cidr_block" {
  default = "192.168.100.0/25"
  type        = string
  description = "aws_public_subnet_cidr_block"
}

variable "aws_private_subnet_name" {
  default = "post_private_subnet"
  type        = string
  description = "aws_private_subnet_name"
}

variable "aws_private_subnet_cidr_block" {
  default = "192.168.100.128/25"
  type        = string
  description = "aws_private_subnet_cidr_block"
}