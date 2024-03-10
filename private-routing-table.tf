resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.taskvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }
}