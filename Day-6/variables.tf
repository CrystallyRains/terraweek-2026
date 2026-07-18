variable "project_name" {
  description = "Name prefix applied to all resources"
  type        = string
  default     = "terraform-capstone"
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh_ingress_cidr" {
  description = "CIDR block allowed to reach the instance over HTTP. Restrict this in real deployments."
  type        = string
  default     = "0.0.0.0/0"
}
