module "web_server" {
  source = "./modules/web-server"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  instance_name   = var.instance_name
  public_key_path = var.public_key_path
}
