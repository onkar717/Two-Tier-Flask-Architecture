data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "flask_app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  # subnet_id= "subnet-019c8fee19757eefb"         

  key_name        = aws_key_pair.key-tf.key_name
  security_groups = [aws_security_group.allow_web.name]
  # vpc_security_group_ids = [ "${aws_security_group.allow_web.name.id}" ]

  user_data = file("${path.module}/script.sh")

  tags = {
    Name = "Flask-App-Deployment"
  }
}
