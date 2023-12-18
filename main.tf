# Configure the AWS Provider
provider "aws" {
  #region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  #instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
    Environment = "demo_environment"
    Terraform = "true"
  }
}

#Private subnet creation
resource "aws_subnet" "private_subnets" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private_subnet_1"
  }
}