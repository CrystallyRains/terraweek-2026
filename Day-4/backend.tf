terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraweek/day4/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true
    encrypt        = true
  }
}
