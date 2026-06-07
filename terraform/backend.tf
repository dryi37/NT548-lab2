terraform {
  backend "s3" {
    bucket = "gr19-backend-tfstate"   
    key    = "lab/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
