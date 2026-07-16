resource "aws_key_pair" "terraform_key" {

  key_name   = "terraweek-key"

  public_key = file(var.public_key_path)

}
