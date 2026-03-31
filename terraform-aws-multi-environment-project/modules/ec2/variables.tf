variable "ec2_instance_name" {
  type        = string
  description = "This variable holds EC2 instance name"
  default     = "my-terraform-automated-instance"
}

variable "ec2_volume_size" {
  type        = number
  description = "This variable holds EC2 volume size"
  default     = 10
}

variable "ec2_instance_state" {
  type        = string
  description = "This variable holds EC2 instance state"
  default     = "stopped"
}

variable "ec2_ami_id" {
  type        = string
  description = "This variable holds EC2 AMI ID"
  default     = "ami-05d2d839d4f73aafb"
}

variable "ec2_instance_type" {
  type        = string
  description = "This variable holds EC2 instance type"
  default     = "t3.micro"
}

variable "env" {
    type        = string
    description = "This variable holds the environment value to determine the key pair name"
    default     = "dev"
  
}

variable "ec2_instance_count" {
  type        = number
  description = "This variable holds my EC2 instance count"
  default     = 1
}