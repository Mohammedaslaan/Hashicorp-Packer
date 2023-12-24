# backend.tf

terraform {
  backend "s3" {
    bucket         = "terraform-state-file-for-packer-infra"
    key            = "terraform.tfstate"
    region         = "ap-south-1"  # Replace with your desired AWS region
  }
}