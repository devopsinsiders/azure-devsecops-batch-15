
resource "azurerm_resource_group" "rg5" {
  name     = "rinkiya-ka-beta"
  location = "West Europe"
}

resource "azurerm_storage_account" "st5" {
  depends_on               = [azurerm_resource_group.rg5]
  name                     = "devopsinsiders1424"
  resource_group_name      = "rinkiya-ka-beta"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
