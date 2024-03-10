resource "aws_instance" "frontend" {
  ami                         = "ami-0885b1f6bd170450c" # Ubuntu 22.04 AMI ID for your region
  instance_type               = "t2.micro"              # Instance type with 1 core and 1GB RAM
  subnet_id                   = aws_subnet.public-subnet.id
  key_name                    = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  root_block_device {
    volume_size = 8 # 8GB disk size
  }

  tags = {
    Name = "frontend-machine"
  }
}

output "ec2_frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}
