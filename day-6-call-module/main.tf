module "test" {
    source = "../day-6-modules"
    ami_id = "ami-0e34b50e714a297f1"
    instance_type = "t3.micro"
    instance_name = "ec2"
}