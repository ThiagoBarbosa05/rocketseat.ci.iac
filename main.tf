terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "s3" {
    bucket = "rocketseat-iac-2"
    key = "state/terraform.tfstate"
    region = "us-east-1"
  }
  
}
provider "aws" {
  region  = "us-east-1"
  # profile = "thiago"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "rocketseat-iac-2"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "rocketseat-iac-2"

  versioning_configuration {
    status = "Enabled"
  }
}

#  AWS_PROFILE=thiago terraform init