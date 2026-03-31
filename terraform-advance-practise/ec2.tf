
#key value pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-automated-key"
  public_key = file("terra-automate-key.pub") #interpolating the public key file
}

#creating Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#creating Security Group
resource "aws_security_group" "my_security_group" {
  name        = "terra-security-group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id  #interpolating the default vpc id

  tags = {
    Name = "terra-security-group"
  }
}

#creating Ingress rule for Security Group which is inbound rule
resource "aws_vpc_security_group_ingress_rule" "my_inbound_rule_http" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "my_inbound_rule_ssh" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#creating Egress rule for Security Group which is outbound rule
resource "aws_vpc_security_group_egress_rule" "my_outbound_rule_all" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#creating EC2 instance
resource "aws_instance" "my_instance" {
# count = 3

  ami           = "ami-05d2d839d4f73aafb"

  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.my_security_group.id] #interpolating the security group id

  key_name = aws_key_pair.my_key_pair.key_name #interpolating the key pair name
  
  #Root Block storage for your EC2 instance
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "my-terraform-automated-instance"
  }
}

# #Resource for instance state
# resource "aws_ec2_instance_state" "my_instance_state" {
#   count = length(aws_instance.my_instance)  
#   instance_id = aws_instance.my_instance[count.index].id #interpolating the instance id of the first instance
#   state = "stopped"
# }

#Resource for instance state without using count and using single instance
resource "aws_ec2_instance_state" "my_instance_state" {
  instance_id = aws_instance.my_instance.id
  state       = "running"
}