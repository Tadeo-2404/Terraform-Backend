//Creates a VPC
resource "aws_vpc" "post_vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = local.aws_vpc_name
  }
}

//Creates a public subnet
resource "aws_subnet" "post_public_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = var.aws_public_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[var.az_index]

  map_public_ip_on_launch = true
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

resource "aws_network_acl_association" "post_public_subnet_acl_association" {
  subnet_id      = aws_subnet.post_public_subnet.id
  network_acl_id = aws_network_acl.post_acl.id
}

resource "aws_network_acl_association" "post_private_subnet_acl_association" {
  subnet_id      = aws_subnet.post_private_subnet.id
  network_acl_id = aws_network_acl.post_acl.id
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
  subnet_id      = aws_subnet.post_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

//ACLS Inbounds and Outbounds
resource "aws_network_acl" "post_acl" {
  vpc_id     = aws_vpc.post_vpc.id
  subnet_ids = [aws_subnet.post_public_subnet.id, aws_subnet.post_private_subnet.id]

  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_ssh_rule_n
    action     = local.aws_network_acl_ingress_ssh_action
    cidr_block = local.aws_network_acl_ingress_ssh_cidr_block
    from_port  = local.aws_network_acl_ingress_ssh_from_port
    to_port    = local.aws_network_acl_ingress_ssh_to_port
  }

  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_http_rule_n
    action     = local.aws_network_acl_ingress_http_action
    cidr_block = local.aws_network_acl_ingress_http_cidr_block
    from_port  = local.aws_network_acl_ingress_http_from_port
    to_port    = local.aws_network_acl_ingress_http_to_port
  }

  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_https_rule_n
    action     = local.aws_network_acl_ingress_https_action
    cidr_block = local.aws_network_acl_ingress_https_cidr_block
    from_port  = local.aws_network_acl_ingress_https_from_port
    to_port    = local.aws_network_acl_ingress_https_to_port
  }

  egress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_egress_rule_n
    action     = local.aws_network_acl_egress_action
    cidr_block = local.aws_network_acl_egress_cidr_block
    from_port  = local.aws_network_acl_egress_from_port
    to_port    = local.aws_network_acl_egress_to_port
  }

  tags = {
    Name = local.aws_network_acl_tag
  }
}

//SECURITY GROUP DEFINITION
resource "aws_security_group" "post_sg" {
  name        = local.aws_security_group_name
  description = local.aws_security_group_description
  vpc_id      = aws_vpc.post_vpc.id

  # SSH Rule
  ingress {
    description = "Allow SSH access"
    protocol    = local.aws_security_group_ingress_ssh_protocol
    from_port   = local.aws_security_group_ingress_ssh_from_port
    to_port     = local.aws_security_group_ingress_ssh_to_port
    cidr_blocks = [local.aws_security_group_ingress_ssh_cdir]
  }

  # HTTP Rule
  ingress {
    description = "Allow HTTP access"
    protocol    = local.aws_security_group_ingress_http_protocol
    from_port   = local.aws_security_group_ingress_http_from_port
    to_port     = local.aws_security_group_ingress_http_to_port
    cidr_blocks = [local.aws_security_group_ingress_http_cdir]
  }

  # HTTPS Rule
  ingress {
    description = "Allow HTTPS access"
    protocol    = local.aws_security_group_ingress_https_protocol
    from_port   = local.aws_security_group_ingress_https_from_port
    to_port     = local.aws_security_group_ingress_https_to_port
    cidr_blocks = [local.aws_security_group_ingress_https_cdir]
  }

  # Egress Rule - Allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    protocol    = local.aws_security_group_egress_protocol
    from_port   = local.aws_security_group_egress_from_port
    to_port     = local.aws_security_group_egress_to_port
    cidr_blocks = [local.aws_security_group_egress_cidr]
  }

  tags = {
    Name = local.aws_security_group_tag_name
  }
}
