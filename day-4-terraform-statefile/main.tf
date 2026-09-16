#create vpc 
resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr
    tags = {
        name = "custom-vpc"
    }
}

resource "aws_subnet" "name" {
  vpc_id     = aws_vpc.name.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsubnet-1"
  }
}

resource "aws_instance" "name" {
  ami           = "ami-0e34b50e714a297f1"
  instance_type = "t3.small"
  subnet_id     = aws_subnet.name.id
  tags = {
    Name = "ec2-instance"
  }
}
