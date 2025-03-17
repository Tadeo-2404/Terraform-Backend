//GET CURRENT AWS REGION
data "aws_region" "current" {}

//GET LIST OF AZS
data "aws_availability_zones" "available" {}