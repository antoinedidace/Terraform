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

module "azure_kubernetes" {
  source = "./module/azure/kubernetes"
  environment = var.environment
  subscription_id = var.azure_subscription_id
}
 