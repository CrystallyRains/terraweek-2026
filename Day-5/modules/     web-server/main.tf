resource "aws_key_pair" "terraform_key" {

  key_name   = "terraweek-key"

  public_key = file(var.public_key_path)

}

resource "aws_security_group" "web_sg" {

  name = "terraweek-web-sg"

  description = "Security Group for TerraWeek"

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

}

resource "aws_instance" "web" {

  ami = var.ami_id

  instance_type = var.instance_type

  key_name = aws_key_pair.terraform_key.key_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tags = {

    Name = var.instance_name

  }

}
