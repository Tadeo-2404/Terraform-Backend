variable "instance_name" {
  description = "post-ec2"
  type        = string
}

variable "aws_region" {
  description = "us-east-1"
  type        = string
}

variable "instance_type" {
  description = "t2.micro"
  type = string
}

variable "ami" {
  description = "ami-08b5b3a93ed654d19"
  type = string
}

//VPC
variable "aws_vpc_name" {
  description = "post-vpc"
  type = string
}

variable "aws_vpc_cidr_block" {
  description = "192.168.100.0/24"
  type = string
}

//SUBNETS
variable "aws_public_subnet_name" {
  description = "post-public-subnet"
  type = string
}

variable "aws_public_subnet_cidr_block" {
  description = "192.168.100.0/25"
  type = string
}

variable "aws_private_subnet_name" {
  description = "post-private-subnet"
  type = string
}

variable "aws_private_subnet_cidr_block" {
  description = "192.168.100.128/25"
  type = string
}