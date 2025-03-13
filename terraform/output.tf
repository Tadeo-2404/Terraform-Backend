output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.aws.instance_id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.aws.instance_public_ip
}

output "instance_name" {
  description = "Instance Name"
  value       = module.aws.instance_name
}

output "instance_type" {
  description = "Instance Type"
  value       = module.aws.instance_type
}

output "postgres_container_id" {
  value = module.docker_container.postgres_container_id
}

output "post_service_id" {
  value = module.docker_container.post_service_id
}

output "post_service_host" {
  value = module.docker_container.post_service_host
}
