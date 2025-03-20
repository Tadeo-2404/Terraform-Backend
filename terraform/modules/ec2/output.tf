output "ec2_public_ip" {
  value = aws_instance.post_ec2.public_ip
}

output "ec2_name" {
  value = aws_instance.post_ec2
}

output "ec2_type" {
  value = aws_instance.post_ec2.ami
}