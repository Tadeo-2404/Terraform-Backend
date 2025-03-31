variable "db_subnet_group_name" {
  description = "db_subnet_group_name for rds"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids for rds"
  type        = string
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