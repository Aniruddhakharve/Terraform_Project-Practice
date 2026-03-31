import {
    id = "i-04456dee9786d8157"
    to = aws_instance.my_existing_instance
}

resource "aws_instance" "my_existing_instance" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    key_name = "underware"
}