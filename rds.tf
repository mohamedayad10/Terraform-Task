resource "aws_db_subnet_group" "rds-gp" {
  name       = "rds-subnet-gp"
  subnet_ids = [aws_subnet.public-subnet.id, aws_subnet.private-subnet.id]

  tags = {
    Name = "My rds subnet group"
  }
}

resource "aws_security_group" "db-sg" {

  name        = "rds-db-sg"
  description = "security group for rds database"
  vpc_id      = aws_vpc.taskvpc.id
  ingress {
    description = "Allow Mysql Traffic "
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds" {
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  publicly_accessible    = true
  username               = "test"
  password               = "oStfFuHgK84="
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.rds-gp.name

  tags = {
    Name = "rds-db"
  }
}