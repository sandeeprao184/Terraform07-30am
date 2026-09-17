
resource "aws_instance" "name" {
  ami           = "ami-0e34b50e714a297f1"
  instance_type = "t3.small"
  tags = {
    Name = "ec2-instance"
  }
}

#lifecycle {
 # create_before_destroy = true
#}

#lifecycle {
 # prevent_destroy = true
#}

#lifecycle {
 # ignore_changes = [tags] 
#}


