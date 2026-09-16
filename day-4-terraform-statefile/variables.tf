variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = ""
}

variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet"
    type        = string
    default     = ""
}
