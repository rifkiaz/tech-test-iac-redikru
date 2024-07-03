variable "subnet_id" {}
variable "instance_type" {}
variable "ssh_key_name" {}
variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
}

variable "vpc_id" {
  description = "VPC ID"
}
