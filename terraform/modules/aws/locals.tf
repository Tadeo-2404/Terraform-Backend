locals {
  aws_instance_name       = "post-ec2"
  aws_instance_type       = "t2.micro"
  aws_instance_ami        = "ami-08b5b3a93ed654d19"
  aws_keypair_name        = "post-ec2-keypair"
  aws_vpc_name            = "post_vpc"
  aws_public_subnet_name  = "post_public_subnet"
  aws_private_subnet_name = "post_private_subnet"
  //AWS INTERNET GATEWAY
  aws_internet_gateway_name = "post-igw"
  //AWS ROUTE TABLE
  aws_route_table_public_name = "public_route_table"
  aws_route_table_public_cidr = "0.0.0.0/0"
  //AWS NETWORK ACL
  aws_network_acl_tag               = "main"
  aws_network_acl_tcp_protocol      = "tcp"
  aws_network_acl_egress_rule_n     = 200
  aws_network_acl_egress_from_port  = 22
  aws_network_acl_egress_to_port    = 22
  aws_network_acl_egress_action     = "allow"
  aws_network_acl_egress_cidr_block = "0.0.0.0/0"
  //AWS NETWORK ACL INGRESS SSH
  aws_network_acl_ingress_ssh_rule_n     = 100
  aws_network_acl_ingress_ssh_from_port  = 22
  aws_network_acl_ingress_ssh_to_port    = 22
  aws_network_acl_ingress_ssh_action     = "allow"
  aws_network_acl_ingress_ssh_cidr_block = "0.0.0.0/0"
  //AWS NETWORK ACL INGRESS HTTP
  aws_network_acl_ingress_http_rule_n     = 101
  aws_network_acl_ingress_http_from_port  = 80
  aws_network_acl_ingress_http_to_port    = 80
  aws_network_acl_ingress_http_action     = "allow"
  aws_network_acl_ingress_http_cidr_block = "0.0.0.0/0"
  //AWS NETWORK ACL INGRESS HTTPS
  aws_network_acl_ingress_https_rule_n     = 102
  aws_network_acl_ingress_https_from_port  = 80
  aws_network_acl_ingress_https_to_port    = 80
  aws_network_acl_ingress_https_action     = "allow"
  aws_network_acl_ingress_https_cidr_block = "0.0.0.0/0"
  //AWS SG
  aws_security_group_name        = "post_sg"
  aws_security_group_description = "Allow TLS inbound traffic and all outbound traffic"
  aws_security_group_tag_name    = "post_sg"
  //AWS VPC SG
  //AWS SG INGRESS SSH
  aws_security_group_ingress_ssh_cdir      = "0.0.0.0/0"
  aws_security_group_ingress_ssh_from_port = 22
  aws_security_group_ingress_ssh_to_port   = 22
  aws_security_group_ingress_ssh_protocol  = "tcp"
  //AWS SG INGRESS HTTP
  aws_security_group_ingress_http_cdir      = "0.0.0.0/0"
  aws_security_group_ingress_http_from_port = 80
  aws_security_group_ingress_http_to_port   = 80
  aws_security_group_ingress_http_protocol  = "tcp"
  //AWS SG INGRESS HTTPS
  aws_security_group_ingress_https_cdir      = "0.0.0.0/0"
  aws_security_group_ingress_https_from_port = 80
  aws_security_group_ingress_https_to_port   = 80
  aws_security_group_ingress_https_protocol  = "tcp"
  //AWS SG EGRESS
  aws_security_group_egress_cidr      = "0.0.0.0/0"
  aws_security_group_egress_from_port = 0
  aws_security_group_egress_to_port   = 0
  aws_security_group_egress_protocol  = "-1"
}