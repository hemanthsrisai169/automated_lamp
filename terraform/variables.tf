variable "env" {
  default     = "Dev"
  description = "Name of the environment"
  type        = string
}

#  VPC
variable "cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "web_vpc_tenancy" {
  default = "default"
  type    = string
}

variable "public_sid1_block" {
  default     = "10.0.1.0/24"
  description = "Public subnet block"
  type        = string
}

variable "public_sid1_block_name" {
  default     = "public-subnet-1"
  description = "Name of Public subnet block"
  type        = string
}

variable "private_sid1_block" {
  default     = "10.0.2.0/24"
  description = "Private subnet block"
  type        = string
}

variable "private_sid1_block_name" {
  default     = "private-subnet-1"
  description = "Name of Private subnet block"
  type        = string
}



# EC2
variable "ami" {
  default     = "ami-053b0d53c279acc90"
  description = "Name of the software image"
  type        = string
}

variable "type" {
  default     = "t3.medium"
  description = "Name of the instance type"
  type        = string
}

variable "az" {
  default     = "us-east-1a"
  description = "Name of AZs"
  type        = string
}

variable "az2" {
  default     = "us-east-1b"
  description = "Name of AZs"
  type        = string
}


# RDS
variable "identifier" {
  type        = string
  default     = "gym"
  description = "Name of your DB cluster"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "type of storage class"
}

variable "db_storage" {
  type    = number
  default = "20"
}

variable "storage_type" {
  type    = string
  default = "gp2"

}

variable "engine" {
  type        = string
  default     = "mysql"
  description = "Name of database engine"
}

variable "engine_version" {
  type    = number
  default = "5.7"
}

variable "username" {
  description = "Name of the user"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  default     = "Password0123"
  sensitive   = true
}


# S3
variable "bucket_name" {
    description = "Name of the bucket"
    type = string
    default = "my-bucket-9878"
}

variable "bucket_tag" {
    description = "Name of the bucket tags"
    type = string
    default = "My bucket"
}