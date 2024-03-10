resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.taskvpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}
