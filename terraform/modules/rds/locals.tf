locals {
  identifier          = "postgres"
  allocated_storage   = 20
  engine              = "postgres"
  engine_version      = "15"
  instance_class      =  "db.t3.micro"
  publicly_accessible = false
  skip_final_snapshot = true
}