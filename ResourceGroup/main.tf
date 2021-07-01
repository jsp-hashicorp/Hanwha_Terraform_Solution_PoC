resource "azurerm_resource_group" "cloo_rg" {
    name        = var.cloo_rg
    location    = var.location
}