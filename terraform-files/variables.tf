variable "aws_region" {
  default = "us-east-1"
}

variable "image_name" {
  type = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "access-key" {
  type = string
}

variable "secret-key" {
  type = string
}
