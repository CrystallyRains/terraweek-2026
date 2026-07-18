# Native Terraform test framework (Terraform 1.6+)
#
# Run with:
#   terraform test
#
# This is a plan-based test (command = plan, the default): it evaluates
# the configuration and checks the planned values without creating any
# real AWS resources. Contrast with command = apply, which would actually
# provision infrastructure and is better suited for full integration tests.

variables {
  project_name       = "tf-test"
  aws_region          = "us-east-1"
  availability_zone    = "us-east-1a"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidr     = "10.0.1.0/24"
}

run "dev_workspace_uses_small_instance" {
  command = plan

  assert {
    condition     = local.instance_type == "t2.micro"
    error_message = "Non-prod workspaces should default to t2.micro"
  }

  assert {
    condition     = module.networking.vpc_cidr == "10.0.0.0/16"
    error_message = "VPC CIDR did not match the configured value"
  }
}

run "environment_output_defaults_to_dev" {
  command = plan

  assert {
    condition     = output.environment == "dev"
    error_message = "Default/unset workspace should resolve to the dev environment"
  }

  assert {
    condition     = output.instance_type == "t2.micro"
    error_message = "Dev environment should provision a t2.micro instance"
  }
}
