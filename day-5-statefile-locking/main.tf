resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "custom-vpc"
    }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.public_subnet_cidr
    tags = {
        Name = "custom-subnet"
    }
}

resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.name.id
    tags = {
        Name = "custom-instance"
    }
}