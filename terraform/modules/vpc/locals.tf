locals {
  aws_vpc_name                  = "post_vpc"
  aws_public_subnet_name        = "post_public_subnet"
  aws_private_subnet_name       = "post_private_subnet"
  aws_vpc_cidr_block            = "192.168.100.0/24"
  aws_public_subnet_cidr_block  = "192.168.100.0/25"
  aws_private_subnet_cidr_block = "192.168.100.128/25"
  //AWS INTERNET GATEWAY
  aws_internet_gateway_name = "post-igw"
  //AWS ROUTE TABLE
  aws_route_table_public_name = "public_route_table"
  aws_route_table_public_cidr = "0.0.0.0/0"
  aws_public_route_cidr       = "0.0.0.0/0"
  //AWS NETWORK ACL
  aws_network_acl_tag                   = "post_acl"
  aws_network_acl_tcp_protocol          = "tcp"
  aws_network_acl_egress_ssh_rule_n     = 200
  aws_network_acl_egress_ssh_from_port  = 22
  aws_network_acl_egress_ssh_to_port    = 22
  aws_network_acl_egress_ssh_action     = "allow"
  aws_network_acl_egress_ssh_cidr_block = "0.0.0.0/0"
  //AWS NETWORK ACL INGRESS SSH
  aws_network_acl_ingress_ssh_rule_n     = 100
  aws_network_acl_ingress_ssh_from_port  = 22
  aws_network_acl_ingress_ssh_to_port    = 22
  aws_network_acl_ingress_ssh_action     = "allow"
  aws_network_acl_ingress_ssh_cidr_block = "0.0.0.0/0"
}