variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "az_index" {
  description = "Index of the AZ to use"
  type        = number
  default     = 0
}

//VPC
variable "aws_vpc_cidr_block" {
  default     = "192.168.100.0/24"
  type        = string
  description = "aws_vpc_cidr_block"
}

//SUBNETS
variable "aws_public_subnet_cidr_block" {
  default     = "192.168.100.0/25"
  type        = string
  description = "aws_public_subnet_cidr_block"
}

variable "aws_private_subnet_cidr_block" {
  default     = "192.168.100.128/25"
  type        = string
  description = "aws_private_subnet_cidr_block"
}