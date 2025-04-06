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
  vpc_id                  = aws_vpc.post_vpc.id
  cidr_block              = local.aws_public_subnet_cidr_block
  availability_zone       = var.aws_az
  map_public_ip_on_launch = true

  tags = {
    Name = local.aws_public_subnet_name
  }
}

resource "aws_subnet" "post_private_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = local.aws_private_subnet_cidr_block
  availability_zone = var.aws_az

  tags = {
    Name = local.aws_private_subnet_name
  }
}

resource "aws_subnet" "post_backed_up_az_private_subnet" {
  vpc_id            = aws_vpc.post_vpc.id
  cidr_block        = local.aws_private_subnet_backup_cidr_block
  availability_zone = var.aws_az_backup

  tags = {
    Name = local.aws_private_subnet_backup_name
  }
}

resource "aws_db_subnet_group" "db_subnet_group_pg" {
  name       = "db_subnet_group_pg"
  subnet_ids = [aws_subnet.post_private_subnet.id, aws_subnet.post_backed_up_az_private_subnet.id]

  tags = {
    Name = "Postgres subnet group"
  }
}

//Creates Elastic IP
resource "aws_eip" "nat_elastic_ip" {
  domain = "vpc"
}

//Creates  a NAT Gateway for private subnet
resource "aws_nat_gateway" "nat_gateway" {
  depends_on    = [aws_eip.nat_elastic_ip]
  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = aws_subnet.post_public_subnet.id

  tags = {
    Name = "nat_gateway"
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

resource "aws_route_table" "private_route_table" {
  vpc_id     = aws_vpc.post_vpc.id
  depends_on = [aws_nat_gateway.nat_gateway]

  route {
    cidr_block = local.aws_route_table_private_cidr
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = local.aws_route_table_private_name
  }
}

//Associates the subnet to the route
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.post_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.post_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_backup_route_table_association" {
  subnet_id      = aws_subnet.post_backed_up_az_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}


//ACLS Inbounds and Outbounds
resource "aws_network_acl" "post_acl" {
  vpc_id     = aws_vpc.post_vpc.id
  subnet_ids = [aws_subnet.post_public_subnet.id]

  # Allow inbound SSH only from a specific IP range
  ingress {
    protocol   = local.aws_network_acl_ingress_icmp_protocol
    rule_no    = local.aws_network_acl_ingress_icmp_rule_n
    action     = local.aws_network_acl_ingress_icmp_action
    cidr_block = local.aws_network_acl_ingress_icmp_cidr_block
    from_port  = local.aws_network_acl_ingress_icmp_from_port
    to_port    = local.aws_network_acl_ingress_icmp_to_port
  }

  # Allow inbound SSH only from a specific IP range
  ingress {
    protocol   = local.aws_network_acl_tcp_protocol
    rule_no    = local.aws_network_acl_ingress_ssh_rule_n
    action     = local.aws_network_acl_ingress_ssh_action
    cidr_block = local.aws_network_acl_ingress_ssh_cidr_block
    from_port  = local.aws_network_acl_ingress_ssh_from_port
    to_port    = local.aws_network_acl_ingress_ssh_to_port
  }

  # Allow inbound HTTP & HTTPS (if hosting a web service)
  ingress {
    protocol   = local.aws_network_acl_ingress_http_protocol
    rule_no    = local.aws_network_acl_ingress_http_rule_n
    action     = local.aws_network_acl_ingress_http_action
    cidr_block = local.aws_network_acl_ingress_http_cidr_block
    from_port  = local.aws_network_acl_ingress_http_from_port
    to_port    = local.aws_network_acl_ingress_http_to_port
  }

  ingress {
    protocol   = local.aws_network_acl_ingress_https_protocol
    rule_no    = local.aws_network_acl_ingress_https_rule_n
    action     = local.aws_network_acl_ingress_https_action
    cidr_block = local.aws_network_acl_ingress_https_cidr_block
    from_port  = local.aws_network_acl_ingress_https_from_port
    to_port    = local.aws_network_acl_ingress_https_to_port
  }

  # Allow all outbound traffic (default safe option)
  egress {
    protocol   = local.aws_network_acl_egress_protocol
    rule_no    = local.aws_network_acl_egress_rule_n
    action     = local.aws_network_acl_egress_action
    cidr_block = local.aws_network_acl_egress_cidr_block
    from_port  = local.aws_network_acl_egress_from_port
    to_port    = local.aws_network_acl_egress_to_port
  }

  tags = {
    Name = "post_acl"
  }
}
