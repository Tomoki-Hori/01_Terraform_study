resource "aws_instance" "example" {
  ami                    = "ami-0b20f552f63953f0e"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data                   = <<-EOF
              #! /bin/bash
              echo "Hello World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}
