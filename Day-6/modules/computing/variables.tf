variable "project_name" {
  description = "Name prefix used to tag compute resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prod, etc.) - typically driven by terraform.workspace"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet to launch the instance into"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to the instance"
  type        = string
}
