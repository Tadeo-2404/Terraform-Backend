output "postgres_sg_id" {
  value = aws_security_group.postgres_sg.id
}

output "ec2_sg_id" {
  value = aws_security_group.post_sg.id
}
