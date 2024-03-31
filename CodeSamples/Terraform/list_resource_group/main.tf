variable "rg_list" {
  default =  ["monu-rg", "sonu-rg", "kalu-rg"]
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(["monu-rg", "sonu-rg", "kalu-rg"])
  name     = each.value
  location = "West Europe"
}


