terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
  backend "local" {}
}

module "aws_vpc" {
  source = "./module/aws/vpc"
  environment = var.environment
}
 