terraform {
  backend "remote" {
    organization = "cloocus-hwsolution-terraform-poc"

    workspaces {
      name = "Hanwha-PoC-RG"
    }
  }
}

#variable azure_subscription {
#    type = string
#    default = "c7107052-a041-47b9-bd39-682496e017ab"
#}
#
#variable azure_tenantID {
#    type = string
#    default = "a74b5451-a280-4768-a5cd-cb47af153c71"
#}
#
#variable azure_clientID {
#    type = string
#    default = "da9e40da-c7af-4139-9fed-1fe21399eb60"
#}
#
#variable azure_client_secret {
#    type = string
#    default = "EZYtex_OLYC9_Ty0yiEqh2c4P9LV_o3HS~"
#}


provider "azurerm" {
    version = "~>2.0"
    
    features {}
}