provider "aws" {
  region = "ap-south-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "tuto"
}

resource "aws_vpc" "vpc_net" {
  cidr_block = "11.1.0.0/16"
  assign_generated_ipv6_cidr_block = false
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = "vpc-net"
    Environment = var.environment
    Region = "ap-south-1"
    Organization = "sloopstash"
  }
}