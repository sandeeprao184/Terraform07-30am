resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "custom-vpc"
    }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_cidr
    tags = {
        Name = "subnet-1"
    }
}

output "subnet_id" {
    value = aws_subnet.name.id
}