variable "rgs" {
  type = map(any)
}

resource "azurerm_resource_group" "example" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}
