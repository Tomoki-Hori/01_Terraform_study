resource "aws_vpc" "test_VPC01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test01"
  }
}

#resource "aws_subnet" "test_public_1a" {
#  cidr_block = "10.0.1.0/24"
#  vpc_id     = aws_vpc.test_public_1a.id
#
#  tags = {
#    Name = "test"
#  }
#}