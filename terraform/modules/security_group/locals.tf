locals {
  //AWS SG
  aws_security_group_name        = "post_sg"
  aws_security_group_description = "Allow TLS inbound traffic and all outbound traffic"
  aws_security_group_tag_name    = "post_sg"
  //AWS VPC SG
  //AWS SG INGRESS SSH
  aws_security_group_ingress_ssh_cdir      = "0.0.0.0/0"
  aws_security_group_ingress_ssh_from_port = 22
  aws_security_group_ingress_ssh_to_port   = 22
  aws_security_group_ingress_ssh_protocol  = "tcp"
  //AWS SG EGRESS
  aws_security_group_egress_cidr      = "0.0.0.0/0"
  aws_security_group_egress_from_port = 0
  aws_security_group_egress_to_port   = 0
  aws_security_group_egress_protocol  = "-1"
  //AWS SG INGRESS POSTGRES RDS
  aws_security_group_ingress_pg_from_port = 5432
  aws_security_group_ingress_pg_to_port   = 5432
  aws_security_group_ingress_pg_protocol  = "tcp"
  //AWS SG EGRESS POSTGRES RDS
  aws_security_group_egress_pg_from_port = 0
  aws_security_group_egress_pg_to_port   = 0 
  aws_security_group_egress_pg_protocol  = "-1"
  aws_security_group_egress_pg_cidr_blocks = ["0.0.0.0/0"]
}