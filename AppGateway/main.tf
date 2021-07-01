data "azurerm_network_interface" "cloo_vm_01_nic" {
  name                = "hwsc-t-krc-terraform-f-web-vm-001-nic"
  resource_group_name = var.cloo_rg
}

data "azurerm_network_interface" "cloo_vm_02_nic" {
  name                = "hwsc-t-krc-terraform-f-web-vm-002-nic"
  resource_group_name = var.cloo_rg
}


resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "appgw_cloo_backend_1" {
    backend_address_pool_id = var.hw_appgw_backend
    ip_configuration_name   = "ipconfig1"
    network_interface_id    = data.azurerm_network_interface.cloo_vm_01_nic.id  
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "appgw_cloo_backend_2" {
    backend_address_pool_id = var.hw_appgw_backend
    ip_configuration_name   = "ipconfig1"
    network_interface_id    = data.azurerm_network_interface.cloo_vm_02_nic.id  
}


