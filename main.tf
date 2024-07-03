module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source      = "./subnet"
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source               = "./ec2"
  subnet_id            = module.subnet.subnet_id
  instance_type        = var.instance_type
  ssh_key_name         = var.ssh_key_name
  ssh_private_key_path = var.ssh_private_key_path
  vpc_id =  module.vpc.vpc_id
}

module "s3" {
  source = "./s3"
}

output "ec2_instance_public_ip" {
  value = module.ec2.instance_public_ip
}