terraform {
  backend "s3" {
    bucket = "tefghncladkll"
    key    = "terraform-statefile/terraform.tfstate"
    region = "us-east-1"
  }
}