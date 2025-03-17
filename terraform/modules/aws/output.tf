
output "aws_region" {
  value = data.aws_region.current.name
}

output "aws_azs" {
  value = data.aws_availability_zones.available.names
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.post_ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.post_ec2.public_ip
}

output "instance_name" {
  description = "Instance Name"
  value       = aws_instance.post_ec2.key_name
}

output "instance_type" {
  description = "Instance Type"
  value       = aws_instance.post_ec2.instance_type
}

output "vpc_id" {
  description = "vpc_id"
  value       = aws_vpc.post_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.post_public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.post_private_subnet.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.post_igw.id
}


output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "network_acl_id" {
  description = "The ID of the Network ACL"
  value       = aws_network_acl.post_acl.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.allow_tls.id
}

output "security_group_ingress_rule_id" {
  description = "The ID of the security group ingress rule"
  value       = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.id
}

output "security_group_egress_rule_id" {
  description = "The ID of the security group egress rule"
  value       = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4.id
}

output "route_table_association_id" {
  description = "The ID of the route table association"
  value       = aws_route_table_association.route_table_association.id
}
