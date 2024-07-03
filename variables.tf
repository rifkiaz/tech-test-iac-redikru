variable "region" {
  default = "ap-southeast-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_key_name" {
  description = "fill your keypair"
  default = "x1-nano"
}

variable "ssh_private_key_path" {
  description = "fill path keypair"
  default = "/home/mraz/git/tech-test/redikru/iac/x1-nano.pem"
}
