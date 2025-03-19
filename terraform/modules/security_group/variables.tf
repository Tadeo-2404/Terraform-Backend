variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_vpc_id" {
  description = "VPC ID for Security group"
  type        = string
}