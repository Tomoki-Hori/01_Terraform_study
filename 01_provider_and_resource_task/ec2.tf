resource "aws_instance" "test-web01" {
  ami           = "ami-0abb7b60d1c69c211"
  instance_type = "t2_micro"
}