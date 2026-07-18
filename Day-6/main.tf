# --- Custom module: networking (VPC, subnet, IGW, route table) ---
module "networking" {
  source = "./modules/networking"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

# --- Registry module: security group ---
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
module "web_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.project_name}-${local.environment}-web-sg"
  description = "Allow inbound HTTP and outbound all traffic"
  vpc_id      = module.networking.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = var.ssh_ingress_cidr
      description = "Allow HTTP"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound"
    }
  ]
}

# --- Custom module: compute (EC2 web server) ---
module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  environment       = local.environment
  instance_type     = local.instance_type
  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.web_security_group.security_group_id
}
