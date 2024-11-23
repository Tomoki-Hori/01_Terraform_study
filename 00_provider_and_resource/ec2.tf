resource "aws_instance" "example" {
  ami           = "ami-0b20f552f63953f0e"
  instance_type = "t2.micro"

  user_data                   = <<-EOF
            #! /bin/bash
            echo "Hello World" > index.html
            nohup bydybox httpd -f -p &
            EOF
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}