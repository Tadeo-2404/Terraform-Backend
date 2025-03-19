# modules/vpc/main.tf

//Creates a VPC
resource "aws_vpc" "post_vpc" {
  cidr_block           = local.aws_vpc_cidr_block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = local.aws_vpc_name
  }
}

//Creates a public subnet
resource "aws_subnet" "post_public_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = local.aws_public_subnet_cidr_block
  availability_zone = var.aws_az

  map_public_ip_on_launch = true
  tags = {
    Name = local.aws_public_subnet_name
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

  route {
    cidr_block = local.aws_route_table_public_cidr
    gateway_id = aws_internet_gateway.post_igw.id
  }

  tags = {
    Name = local.aws_route_table_public_name
  }
}

//Associates the subnet to the route
resource "aws_route_table_association" "public_route_table_association" {
  depends_on     = [aws_subnet.post_public_subnet, aws_route_table.public_route_table]
  subnet_id      = aws_subnet.post_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

//ACLS Inbounds and Outbounds
resource "aws_network_acl" "post_acl" {
  vpc_id     = aws_vpc.post_vpc.id
  subnet_ids = [aws_subnet.post_public_subnet.id]

  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_ssh_rule_n
    action     = local.aws_network_acl_ingress_ssh_action
    cidr_block = local.aws_network_acl_ingress_ssh_cidr_block
    from_port  = local.aws_network_acl_ingress_ssh_from_port
    to_port    = local.aws_network_acl_ingress_ssh_to_port
  }

  egress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_egress_ssh_rule_n
    action     = local.aws_network_acl_egress_ssh_action
    cidr_block = local.aws_network_acl_egress_ssh_cidr_block
    from_port  = local.aws_network_acl_egress_ssh_from_port
    to_port    = local.aws_network_acl_egress_ssh_to_port
  }

  tags = {
    Name = local.aws_network_acl_tag
  }
}