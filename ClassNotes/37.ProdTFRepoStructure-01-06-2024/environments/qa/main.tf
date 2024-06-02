variable "rg_input" {}

module "rgs" {
  source = "../../modules/azurerm_rg"
  rgs = var.rg_input
}