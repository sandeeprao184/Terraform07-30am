resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project-vpc"
  }
}

resource "aws_subnet" "name" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsubnet-1"
  }
}

resource "aws_subnet" "name2" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "privatesubnet-1"
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "project-igw"
  }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
    }
}

resource "aws_route_table_association" "name" {
  subnet_id      = aws_subnet.name.id
  route_table_id = aws_route_table.name.id
}

resource "aws_eip" "name" {
  domain = "vpc"
}

resource "aws_nat_gateway" "name2" {
  allocation_id = aws_eip.name.id
  subnet_id     = aws_subnet.name.id
  tags = {
    Name = "project-nat-gateway"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name2.id
  }
}


resource "aws_security_group" "name" {
  name        = "project-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.name.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "name" {
  ami           = "ami-0e34b50e714a297f1"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.name.id
  vpc_security_group_ids = [aws_security_group.name.id]
  tags = {
    Name = "ec2-instance"
  }
}

resource "aws_instance" "name2" {
  ami           = "ami-0e34b50e714a297f1"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.name2.id
  vpc_security_group_ids = [aws_security_group.name.id]
  tags = {
    Name = "ec2-instance-private"
  }
}

