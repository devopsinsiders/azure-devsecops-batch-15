# Declare the required provider and its version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Define an Azure resource group named "rg-bhondhulal" in the West Europe region
resource "azurerm_resource_group" "rg-block-name" {
  name     = "rg-bhondhulal"
  location = "West Europe"
}

# Define another Azure resource group named "rg-dhondhulal" in the West Europe region
resource "azurerm_resource_group" "rg-block-name2" {
  name     = "rg-dhondhulal"
  location = "West Europe"
}

# Define a third Azure resource group named "dhondhu-rg" in the West Europe region
resource "azurerm_resource_group" "rg-block-name3" {
  name     = "dhondhu-rg"
  location = "West Europe"
}
