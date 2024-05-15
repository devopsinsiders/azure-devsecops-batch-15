storage_account_map = {
  st1 = {
    storage_account_name     = "dhondhusa"
    resource_group_name      = "rg_devopsinsders"
    location                 = "westeurope"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  st2 = {
    storage_account_name     = "dhondhusa1"
    resource_group_name      = "rg_devopsinsders"
    location                 = "westeurope"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    network_rules = {
        default_action = "Deny"
    }
  }
}
