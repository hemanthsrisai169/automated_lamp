# Security Groups
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source            = "./modules/vpc"
  web_vpc_cidr      = var.cidr_block
  web_vpc_tenancy   = var.web_vpc_tenancy
  public_sid1       = var.public_sid1_block
  public_sid1_name  = var.public_sid1_block_name
  private_sid1      = var.private_sid1_block
  private_sid1_name = var.private_sid1_block_name
  az1               = var.az
  az2               = var.az2
}


module "key-pair" {
  source       = "./modules/key-pair"
  key_name     = "lamp-test"
  key_filename = "lamp-test.pem"
}

# Elastic Cloud Compute
module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami
  type                   = var.type
  az1                    = var.az
  vpc_id                 = module.vpc.vpc_id
  public_subnet1         = module.vpc.public_subnet1
  key_pair               = module.key-pair.key_name
  web_security_groups_id = module.sg.web_security_groups_id
  env                    = var.env
}


# rds
module "rds" {
  source               = "./modules/rds"
  identifier           = var.identifier
  instance_class       = var.instance_class
  allocated_storage    = var.db_storage
  engine               = var.engine
  engine_version       = var.engine_version
  username             = var.username
  password             = var.db_password
  public_subnet1       = module.vpc.public_subnet1
  private_subnet1      = module.vpc.private_subnet1
  db_security_group_id = module.sg.database_security_groups_id
}