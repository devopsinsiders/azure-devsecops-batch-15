resource "azurerm_resource_group" "resource_groups" {
  for_each = var.rg_complex_map
  name     = each.value.rg_name
  location = each.value.rg_location
}
