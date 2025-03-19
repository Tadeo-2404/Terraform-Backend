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