# Security Groups
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source                     = "./modules/vpc"
  web_vpc_cidr               = var.cidr_block
  web_vpc_tenancy            = var.web_vpc_tenancy
  availability_zones         = var.availability_zones
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks

  # public_sid1       = var.public_sid1_block
  # public_sid1_name  = var.public_sid1_block_name
  # private_sid1      = var.private_sid1_block
  # private_sid1_name = var.private_sid1_block_name
  # private_sid2      = var.private_sid2_block
  # private_sid2_name = var.private_sid2_block_name
  # az1               = var.az
  # az2               = var.az2
  # az3               = var.az3
}


module "key-pair" {
  source       = "./modules/key-pair"
  key_name     = "lamp-test"
  key_filename = "lamp-test.pem"
}

# Elastic Cloud Compute
module "ec2" {
  source = "./modules/ec2"
  ami    = var.ami
  type   = var.type
  # az1                    = var.az
  az                     = var.availability_zones
  vpc_id                 = module.vpc.vpc_id
  key_pair               = module.key-pair.key_name
  web_security_groups_id = module.sg.web_security_groups_id
  env                    = var.env
  public_subnet_ids      = module.vpc.public_subnet_ids



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
  private_subnets      = module.vpc.private_subnet_ids
  db_security_group_id = module.sg.database_security_groups_id
}