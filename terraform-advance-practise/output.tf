output "ec2_public_ip" {
    value = aws_instance.my_instance.public_ip
    description = "This output will display the public IP address of the EC2 instance"
}

output "ec2_public_dns" {
    value = aws_instance.my_instance.public_dns
    description = "This output will display the public DNS name of the EC2 instance"
}


output "ec2_public_ip_existing_instance" {
    value = aws_instance.my_existing_instance.public_ip
    description = "This output will display the public IP address of the EC2 instance"
}