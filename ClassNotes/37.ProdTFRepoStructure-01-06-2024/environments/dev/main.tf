variable "rg_input" {}

module "rgs" {
  source = "../../modules/azurerm_rg"
  rgs    = var.rg_input
}

module "vnet" {
  source              = "../../modules/azurerm_vnet"
  vnet_name           = "vnet1"
  resource_group_name = "rg1"
  location            = "westeurope"
}
