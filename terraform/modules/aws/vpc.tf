//Creates a VPC
resource "aws_vpc" "post_vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.aws_vpc_name
  }
}

//Creates a public subnet
resource "aws_subnet" "post_public_subnet" {
  vpc_id            = aws_vpc.post_vpc
  cidr_block        = var.aws_public_subnet_cidr_block
  availability_zone = var.aws_region
  tags = {
    Name = var.aws_public_subnet_name
  }
}

//Creates a private subnet
resource "aws_subnet" "post_private_subnet" {
  vpc_id            = aws_vpc.post_vpc
  cidr_block        = var.aws_private_subnet_cidr_block
  availability_zone = var.aws_region
  tags = {
    Name = var.aws_private_subnet_name
  }
}

//Creates an Internet Gateway
resource "aws_internet_gateway" "post_igw" {
  vpc_id = aws_vpc.post_vpc.id

  tags = {
    Name = "post_igw"
  }
}

//Creates a routing table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.post_vpc.id


  tags = {
    Name = "public_route_table"
  }
}

//Creates a route for the routing table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.post_igw
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
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.post_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.post_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
