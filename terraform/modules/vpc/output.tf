output "vpc_id" {
  value = aws_vpc.post_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.post_public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.post_private_subnet.id
}
