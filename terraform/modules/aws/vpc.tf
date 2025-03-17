//Creates a VPC
resource "aws_vpc" "post_vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = local.aws_vpc_name
  }
}

//Creates a public subnet
resource "aws_subnet" "post_public_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = var.aws_public_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[var.az_index]
  tags = {
    Name = local.aws_public_subnet_name
  }
}

//Creates a private subnet
resource "aws_subnet" "post_private_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = var.aws_private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[var.az_index]
  tags = {
    Name = local.aws_private_subnet_name
  }
}

//Creates an Internet Gateway
resource "aws_internet_gateway" "post_igw" {
  vpc_id = aws_vpc.post_vpc.id

  tags = {
    Name = local.aws_internet_gateway_name
  }
}

//Creates a routing table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.post_vpc.id


  tags = {
    Name = local.aws_route_table_public_name
  }
}

//Creates a route for the routing table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = local.aws_route_table_public_cidr
  gateway_id             = aws_internet_gateway.post_igw.id
}

//Associates the subnet to the route
resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.post_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

//ACLS Inbounds and Outbounds
resource "aws_network_acl" "post_acl" {
  vpc_id     = aws_vpc.post_vpc.id
  subnet_ids = [aws_subnet.post_public_subnet.id, aws_subnet.post_private_subnet.id]

  egress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_egress_rule_n
    action     = local.aws_network_acl_egress_action
    cidr_block = local.aws_network_acl_egress_cidr_block
    from_port  = local.aws_network_acl_egress_from_port
    to_port    = local.aws_network_acl_egress_to_port
  }

  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_rule_n
    action     = local.aws_network_acl_ingress_action
    cidr_block = local.aws_network_acl_ingress_cidr_block
    from_port  = local.aws_network_acl_ingress_from_port
    to_port    = local.aws_network_acl_ingress_to_port
  }

  tags = {
    Name = local.aws_network_acl_tag
  }
}

resource "aws_security_group" "allow_tls" {
  name        = local.aws_security_group_name
  description = local.aws_security_group_description
  vpc_id      = aws_vpc.post_vpc.id

  tags = {
    Name = local.aws_security_group_tag_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.post_vpc.cidr_block
  from_port         = local.aws_vpc_security_group_ingress_rule_from_port
  ip_protocol       = local.aws_vpc_security_group_ingress_rule_ip_protocol
  to_port           = local.aws_vpc_security_group_ingress_rule_to_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = local.aws_vpc_security_group_egress_rule_cidr_ipv4
  ip_protocol       = local.aws_vpc_security_group_egress_rule_ip_protocol
}
