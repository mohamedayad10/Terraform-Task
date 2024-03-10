resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.private-subnet.id

  depends_on = [
    aws_internet_gateway.gateway,
  ]
}
