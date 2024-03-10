resource "aws_vpc" "taskvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "task"
  }
} 