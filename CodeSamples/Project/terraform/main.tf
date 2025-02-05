variable "rg_name" {
    description = "The name of the resource group"
}
variable "location" {
    description = "The location of the resource group"
}
resource "azurerm_resource_group" "rg" {
    name     = var.rg_name
    location = var.location
}