resource "azurerm_resource_group" "dhondhurg" {
  for_each = {
    rg1 = {
      name     = "dhondhu-rg"
      location = "westeurope"
    }
  }
  name     = each.value.name
  location = each.value.location
}

# Nested Loops
resource "azurerm_virtual_network" "dhondhuvnet" {
  for_each            = var.vnets
  name                = each.value.vnetName
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}

