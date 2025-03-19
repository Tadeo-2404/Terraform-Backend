# modules/ec2/main.tf

resource "aws_instance" "post_ec2" {
  ami                    = local.aws_instance_ami
  instance_type          = local.aws_instance_type
  key_name               = local.aws_keypair_name
  availability_zone      = var.aws_az
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id

  tags = {
    Name = local.aws_instance_name
  }
}

resource "aws_key_pair" "tfkey" {
  key_name   = local.aws_keypair_name
  public_key = file("tfkey.pub")
}