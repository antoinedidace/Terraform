provider "azurerm" {
  subscription_id = var.subscription_id
  resource_provider_registrations = "none"
  features {}
}

resource "azurerm_virtual_network" "vnet" {
  name = "vnet"
  resource_group_name = "sloopstash-prd"
  location = "centralindia"
  address_space = ["11.1.0.0/16"]
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = {
    Name = "vnet"
    Environment = var.environment
    Region = "centralindia"
    Organization = "sloopstash"
  }
}
 