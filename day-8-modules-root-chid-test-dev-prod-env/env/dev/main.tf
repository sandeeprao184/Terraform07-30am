module "network" {
    source = "../../modules/network"
    vpc_cidr = "10.0.0.0/16"
    subnet_cidr = "10.0.0.0/24"
}

module "compute" {
    source = "../../modules/compute"
    ami_id = "ami-0e34b50e714a297f1"
    instance_type = "t3.micro"
    
    
}