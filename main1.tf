terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}
// This is Authentication 
provider "azurerm" {
  subscription_id = ""
  client_id = ""
  client_secret = ""
  tenant_id = ""
  features {}
}


resource "azurerm_resource_group" "app_grp" {
  name = "app-grp"
  location = "East Europe"
}