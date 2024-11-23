resource "aws_instance" "example" {
  ami           = "ami-0b20f552f63953f0e"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}