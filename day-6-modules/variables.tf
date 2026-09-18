variable "ami_id" {
  default = ""
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  default = ""
  description = "The instance type to use for the EC2 instance"
}

variable "instance_name" {
  default = ""
  description = "The name tag to assign to the EC2 instance"
}