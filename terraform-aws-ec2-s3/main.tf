terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = "t3.micro"
  instance_name = "terraform-lab-module"
}

resource "aws_s3_bucket" "lab" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name = "terraform-lab-bucket"
  }
}
