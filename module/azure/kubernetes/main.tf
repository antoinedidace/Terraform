provider "azurerm" {
  subscription_id = var.subscription_id
  resource_provider_registrations = "none"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "sloopstash-prd"
  location = "Central India"
  tags = {
    Name = "sloopstash-prd"
    Environment = var.environment
    Region = "centralindia"
    Organization = "sloopstash"
  }
}
resource "azurerm_virtual_network" "vnet" {
  depends_on = [azurerm_resource_group.rg]
  name = "vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
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
 
 resource "azurerm_subnet" "container_s2_vnet_aks_sn_1" {
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet
  ]
  name = "container-s2-vnet-aks-sn-1"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["11.1.3.0/24"]
}
resource "azurerm_subnet" "container_s2_vnet_aks_sn_2" {
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet
  ]
  name = "container-s2-vnet-aks-sn-2"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["11.1.4.0/24"]
}
 