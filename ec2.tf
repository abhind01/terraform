# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                         = "ami-09be801d2a75fa8a8"
  instance_type               = "t2.micro"
  #count                       = 1
  key_name                    = "testserver"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "subnet-0f34c26a92c604aac"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demoinstance1" {
  ami                         = "ami-09be801d2a75fa8a8"
  instance_type               = "t2.micro"
  #count                       = 1
  key_name                    = "testserver"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "subnet-00b99246815aca123"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance 2"
  }
}
