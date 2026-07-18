project_name       = "terraform-capstone"
aws_region         = "us-east-1"
availability_zone  = "us-east-1a"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"

# For a real deployment, restrict this to your own IP, e.g. "203.0.113.4/32"
ssh_ingress_cidr = "0.0.0.0/0"
