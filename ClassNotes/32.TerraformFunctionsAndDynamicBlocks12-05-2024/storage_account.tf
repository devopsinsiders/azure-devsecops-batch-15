variable "storage_account_map" {}

resource "azurerm_storage_account" "example" {
  for_each                 = var.storage_account_map
  name                     = each.value.storage_account_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  dynamic "network_rules" {
    for_each = lookup(each.value, "network_rules", {})
    content {
      default_action = lookup(network_rules.value, "default_action", null)
    }
  }

}





