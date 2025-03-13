output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.post-ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.post-ec2.public_ip
}

output "instance_name" {
  description = "Instance Name"
  value = aws_instance.post-ec2.key_name
}

output "instance_type" {
  description = "Instance Type"
  value = aws_instance.post-ec2.instance_type
}