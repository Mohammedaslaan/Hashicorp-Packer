# Terraform Block
terraform {
  required_version = "~> 1.6.4"
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}
