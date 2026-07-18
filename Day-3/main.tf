############################################
# Default VPC
############################################

data "aws_vpc" "default" {
  default = true
}

############################################
# SSH Key Pair
############################################

resource "aws_key_pair" "terraweek_key" {

  key_name   = var.key_name
  public_key = file(var.public_key_path)

  tags = {
    Name = var.key_name
  }

}

############################################
# Security Group
############################################

resource "aws_security_group" "web_sg" {

  name        = "terraweek-web-sg"
  description = "Security Group for TerraWeek EC2"
  vpc_id      = data.aws_vpc.default.id

  ingress {

    description = "Allow SSH"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    description = "Allow all outbound traffic"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "terraweek-web-sg"
  }

}

############################################
# EC2 Instance
############################################

resource "aws_instance" "web_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = aws_key_pair.terraweek_key.key_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tags = {
    Name        = var.instance_name
    Environment = "Learning"
    Project     = "TerraWeek"
  }

  lifecycle {
    create_before_destroy = true
  }

}