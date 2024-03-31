resource "azurerm_resource_group" "rg" {
  for_each = {
    monu-rg = "westus"
    sonu-rg = "centralindia"
    kalu-rg = "eastus"
    tonu-rg = "canadacentral"
    lalu-rg = "southindia"
  }
  name     = each.key
  location = each.value
}

