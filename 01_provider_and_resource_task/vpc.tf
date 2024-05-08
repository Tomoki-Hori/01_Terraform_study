resource "aws_vpc" "test_vpc_01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test_01_vpc"
  }
}

resource "aws_subnet" "test_public_1a" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = aws_vpc.test_vpc_01.id

  tags = {
    Name = "test_public_1a"
  }
}


resource "aws_subnet" "test_private_1a" {
  cidr_block = "10.0.20.0/24"
  vpc_id     = aws_vpc.test_vpc_01.id

  tags = {
    Name = "test_private_1a"
  }
}


resource "aws_security_group" "test_01_sg" {
  name        = "test_01_sg"
  description = "for_HTTP_and_HTTPS"
  vpc_id      = aws_vpc.test_vpc_01.id

  tags = {
    Name = "test_01_sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "test_01_sg_http" {
  security_group_id = aws_security_group.test_01_sg.id
  description       = "for_http"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "test_01_sg_https" {
  security_group_id = aws_security_group.test_01_sg.id
  description       = "for_https"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_instance" "test_web_" {
  count                  = 5
  ami                    = "ami-04e0b6d6cfa432943"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test_01_sg.id]
  subnet_id              = aws_subnet.test_private_1a.id

  tags = {
    Name = "test_web_0${count.index + 1}"
  }
}