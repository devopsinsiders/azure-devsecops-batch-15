terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-block-name" {
  name     = "rg-bhondhulal"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg-block-name2" {
  name     = "rg-dhondhulal"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg-block-name3" {
  name     = "dhondhu-rg"
  location = "West Europe"
}