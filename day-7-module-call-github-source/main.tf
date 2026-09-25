module "gitsource" {
    source = "github.com/sandeeprao184/Terraform07-30am/day-6-modules"
    ami_id = "ami-0e34b50e714a297f1"
    instance_type = "t3.micro"
  
}