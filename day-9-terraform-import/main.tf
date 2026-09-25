  resource "aws_instance" "name" {
   ami = "ami-0e34b50e714a297f1"
   instance_type = "t3.micro"
   tags = {
     Name = "ec2"
   }
 }

#terraform import aws_instance.name i-08581ecf5f5e16b81

# resource "aws_s3_bucket" "name" {
#     bucket = "test-devtest-veera"
  
# }
# resource "aws_s3_bucket_versioning" "example_versioning" {
#   bucket = aws_s3_bucket.name.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }