terraform {
  backend "remote" {
    organization = "cloocus-hwsolution-terraform-poc"

    workspaces {
      name = "Hanwha-PoC-AppGW"
    }
  }
}

provider "azurerm" {
    version = "~>2.0"
    features {}
}