resource "azurerm_storage_account" "st1" {
  name                     = "rinkistorage1"
  resource_group_name      = "rinkiya-ke-new-papa6"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "st2" {
  name                     = "rinkistorage2"
  resource_group_name      = "rinkiya-ke-new-papa7"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}