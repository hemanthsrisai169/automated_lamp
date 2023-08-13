output "web_server_ip" {
  value = module.ec2.web_server_1_public_ip
}

output "rds_hostname" {
  value = module.rds.rds_hostname
}

output "s3_domain_name" {
  value = module.s3.bucket_domain_name
}