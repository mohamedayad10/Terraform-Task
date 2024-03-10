resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.taskvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

}