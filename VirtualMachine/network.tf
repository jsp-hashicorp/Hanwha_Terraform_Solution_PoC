data "azurerm_virtual_network" "hw_vnet" {
  name                = var.hw_vnet
  resource_group_name = var.hw_rg
}

data "azurerm_subnet" "hw_subnet" {
  name                 = var.hw_subnet
  resource_group_name  = var.hw_rg
  virtual_network_name = var.hw_vnet
}
