resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.taskvpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-route-table.id
}
