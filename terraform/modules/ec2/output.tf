output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_subnet_id" {
  value = module.ec2.subnet_id
}

output "ec2_security_group_id" {
  value = module.ec2.security_group_id
}
