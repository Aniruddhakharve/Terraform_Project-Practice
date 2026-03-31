#key value pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "${var.env}-terra-automate-key"
  public_key = file("././terra-automate-key.pub") #interpolating the public key file
}

#creating Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#creating Security Group
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}terra-security-group"
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
  count = var.ec2_instance_count

  ami           = var.ec2_ami_id

  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [aws_security_group.my_security_group.id] #interpolating the security group id

  key_name = aws_key_pair.my_key_pair.key_name #interpolating the key pair name
  
  #Root Block storage for your EC2 instance
  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-${var.ec2_instance_name}"
  }
}

# #Resource for instance state
# resource "aws_ec2_instance_state" "my_instance_state" {
#   count = length(aws_instance.my_instance)  
#   instance_id = aws_instance.my_instance[count.index].id #interpolating the instance id of the first instance
#   state = var.ec2_instance_state
# }

# #Resource for instance state without using count and using single instance
# resource "aws_ec2_instance_state" "my_instance_state" {
#   instance_id = aws_instance.my_instance.id
#   state       = var.ec2_instance_state
# }