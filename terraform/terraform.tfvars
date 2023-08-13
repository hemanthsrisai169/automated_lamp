# vpc
cidr_block              = "10.0.0.0/16"
public_sid1_block       = "10.0.1.0/24"
public_sid1_block_name  = "Public subnet block"
private_sid1_block      = "10.0.2.0/24"
private_sid1_block_name = "Name of Private subnet block"

# EC2
env  = "Dev"
ami  = "ami-053b0d53c279acc90"
type = "t3.small"
az   = "us-east-1a"
az2  = "us-east-1b"


# S3
bucket_name    = "my-static-files-bucket"
bucket_tag = "My bucket"


# RDS
identifier     = "gym"
instance_class = "db.t3.small"
storage_type   = "gp2"
db_storage     = 20
engine         = "mysql"
engine_version = "5.7"
username       = "admin"
db_password    = "Password0123"