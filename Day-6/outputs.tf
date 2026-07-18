output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.public_subnet_id
}

output "instance_public_ip" {
  description = "Public IP address of the web server"
  value       = module.compute.public_ip
}

output "environment" {
  description = "Active Terraform workspace / environment"
  value       = local.environment
}

output "instance_type" {
  description = "EC2 instance type used for this environment"
  value       = local.instance_type
}
