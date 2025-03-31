resource "aws_db_instance" "postgres" {
  identifier             = local.identifier
  allocated_storage      = local.allocated_storage
  engine                 = local.engine
  engine_version         = local.engine_version
  instance_class         = local.instance_class
  publicly_accessible    = local.publicly_accessible
  skip_final_snapshot    = local.skip_final_snapshot
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
}