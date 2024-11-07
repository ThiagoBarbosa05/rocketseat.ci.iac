terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "AdministratorAccess-686255959518"
}

#  aws s3 ls --profile AdministratorAccess-686255959518