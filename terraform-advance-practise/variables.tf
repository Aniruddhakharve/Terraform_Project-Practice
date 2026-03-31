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
  default     = "running"
}