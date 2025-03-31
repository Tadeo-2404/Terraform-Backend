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
variable "db_username" {
  description = "username for db"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "password for db"
  type        = string
  sensitive   = true
}