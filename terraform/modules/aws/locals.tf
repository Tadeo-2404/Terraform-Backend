locals {
  aws_instance_name       = "post-ec2"
  aws_instance_type       = "t2.micro"
  aws_instance_ami        = "ami-08b5b3a93ed654d19"
  aws_vpc_name            = "post_vpc"
  aws_public_subnet_name  = "post_public_subnet"
  aws_private_subnet_name = "post_private_subnet"
  //AWS INTERNET GATEWAY
  aws_internet_gateway_name = "post-igw"
  //AWS ROUTE TABLE
  aws_route_table_public_name = "public_route_table"
  aws_route_table_public_cidr = "0.0.0.0/0"
  //AWS NETWORK ACL
  aws_network_acl_tag = "main"
  aws_network_acl_tcp_protocol = "tcp"
  aws_network_acl_egress_rule_n = 200
  aws_network_acl_egress_from_port = 443
  aws_network_acl_egress_to_port = 443
  aws_network_acl_egress_action = "allow"
  aws_network_acl_egress_cidr_block = "0.0.0.0/0"
  aws_network_acl_ingress_rule_n = 100
  aws_network_acl_ingress_from_port = 80
  aws_network_acl_ingress_to_port = 80
  aws_network_acl_ingress_action = "allow"
  aws_network_acl_ingress_cidr_block = "0.0.0.0/0"
  //AWS SG
  aws_security_group_name = "allow_tls"
  aws_security_group_description = "Allow TLS inbound traffic and all outbound traffic"
  aws_security_group_tag_name = "allow_tls"
  //AWS VPC SG
  aws_vpc_security_group_ingress_rule_from_port = 443
  aws_vpc_security_group_ingress_rule_to_port = 443
  aws_vpc_security_group_ingress_rule_ip_protocol = "tcp"
  aws_vpc_security_group_egress_rule_cidr_ipv4 = "0.0.0.0/0"
  aws_vpc_security_group_egress_rule_ip_protocol = "-1"
}