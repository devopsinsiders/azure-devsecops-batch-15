variable "vnet_name" {}
variable "location" {}
variable "resource_group_name" {}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}