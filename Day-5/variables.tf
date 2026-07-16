variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type    = string
  default = "terraweek-module-demo"
}

variable "public_key_path" {
  type = string
}
