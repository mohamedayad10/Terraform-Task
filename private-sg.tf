resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Security group for private EC2 instance"

  vpc_id = aws_vpc.taskvpc.id

  # Allow SSH access from within the VPC (assuming SSH is needed for management)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic from the public subnet (if required)
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
