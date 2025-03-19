variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_az" {
  description = "AWS AZ"
  type        = string
  default     = "us-east-1a"
}


variable "subnet_id" {
  description = "Subnet id for EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security grop for EC2 instance"
  type        = string
}