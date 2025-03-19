variable "aws_region" {
  description = "AWS Region"
  type        = string
}
variable "aws_az" {
  description = "AWS AZ"
  type        = string
}

variable "aws_ec2_instance_name" {
  description = "Name for EC2 instance"
  type = string
}

variable "aws_ec2_ami" {
  description = "AMI for EC2 instance"
  type = string
}

variable "aws_ec2_instance_type" {
  description = "Instance type for EC2 instance"
  type = string
}