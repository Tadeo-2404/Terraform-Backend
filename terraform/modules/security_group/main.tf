# modules/security_group/main.tf

//SECURITY GROUP DEFINITION
resource "aws_security_group" "post_sg" {
  name        = local.aws_security_group_name
  description = local.aws_security_group_description
  vpc_id      = var.aws_vpc_id

  # SSH Rule
  ingress {
    description = "Allow SSH access"
    protocol    = local.aws_security_group_ingress_ssh_protocol
    from_port   = local.aws_security_group_ingress_ssh_from_port
    to_port     = local.aws_security_group_ingress_ssh_to_port
    cidr_blocks = [local.aws_security_group_ingress_ssh_cdir]
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
