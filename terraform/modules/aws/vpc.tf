//Creates a VPC
resource "aws_vpc" "post-vpc" {
    cidr_block = var.aws_vpc_cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name = var.aws_vpc_name
    }
}

//Creates a public subnet
resource "aws_subnet" "post-public-subnet" {
  vpc_id = aws_vpc.post-vpc
  cidr_block = var.aws_public_subnet_cidr_block
  availability_zone = var.aws_region
  tags = {
    Name = var.aws_public_subnet_name
  }
}

//Creates a private subnet
resource "aws_subnet" "post-private-subnet" {
  vpc_id = aws_vpc.post-vpc
  cidr_block = var.aws_private_subnet_cidr_block
  availability_zone = var.aws_region
  tags = {
    Name = var.aws_private_subnet_name
  }
}

//Creates an Internet Gateway
resource "aws_internet_gateway" "post-igw" {
  vpc_id = aws_vpc.post-vpc.id

  tags = {
    Name = "post-igw"
  }
}

//Creates a routing table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.post-vpc.id


  tags = {
    Name = "public_route_table"
  }
}

//Creates a route for the routing table
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.post-igw
}

//Associates the subnet to the route
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.post-public-subnet.id
  route_table_id = aws_route_table.public_route_table.id
}