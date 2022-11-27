data "aws_subnet" "subnetdb1" {
  id = "subnet-08427e533b465f314"
}

data "aws_subnet" "subnetdb2" {
  id = "subnet-08427e533b465f314"
}

# Creating RDS Instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [data.aws_subnet.subnetdb1.id, data.aws_subnet.subnetdb2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "8.0.2`8"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mydb"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}