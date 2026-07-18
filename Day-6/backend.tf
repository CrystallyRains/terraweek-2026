# Remote state backend.
#
# Uses Terraform 1.10+ native S3 state locking (use_lockfile = true)
# instead of a separate DynamoDB lock table.
#
# NOTE: backend blocks cannot use variables, so replace the bucket name
# below with your own globally-unique S3 bucket before running `terraform init`.
terraform {
  backend "s3" {
    bucket       = "terraform-capstone-pro-b1"
    key          = "terraform-capstone/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
