output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.ec2_public_ip
}

output "instance_name" {
  description = "Instance Name"
  value       = module.ec2.ec2_name
}

output "instance_type" {
  description = "Instance Type"
  value       = module.ec2.ec2_type
}