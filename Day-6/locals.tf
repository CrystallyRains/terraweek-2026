# terraform.workspace drives environment-specific sizing.
#
#   terraform workspace new dev
#   terraform workspace new prod
#   terraform workspace select dev
#
# `default` workspace (if someone forgets to switch) is treated like dev.
locals {
  environment = terraform.workspace == "default" ? "dev" : terraform.workspace

  instance_type = local.environment == "prod" ? "t3.small" : "t2.micro"
}
