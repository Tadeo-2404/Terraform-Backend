variable "db_user" {
  description = "Database username"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "Database password"
  type = string
  sensitive = true
}

variable "db_name" {
  description = "Database name"
  type = string
}

variable "docker_username" {
  description = "docker username"
  type = string
  sensitive = true
}

variable "docker_password" {
  description = "docker password"
  type = string
  sensitive = true
}