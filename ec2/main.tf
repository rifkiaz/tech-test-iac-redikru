resource "aws_security_group" "ssh" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Mengizinkan akses dari semua IP. Gunakan lebih spesifik CIDR block untuk keamanan.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_instance" "main" {
  ami           = "ami-0497a974f8d5dcef8" # Ubuntu AMI
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.ssh_key_name

  vpc_security_group_ids =  [aws_security_group.ssh.id]

  tags = {
    Name = "instance-ubuntu-redikru"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file(var.ssh_private_key_path)
    host     = aws_instance.main.public_ip
  }
}

output "instance_id" {
  value = aws_instance.main.id
}

output "instance_public_ip" {
  value = aws_instance.main.public_ip
}
