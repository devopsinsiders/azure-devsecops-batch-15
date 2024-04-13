data "azurerm_subnet" "gogo_subnet" {
  name                 = "frontend-subnet"
  virtual_network_name = "devops-vnet2"
  resource_group_name  = "rg_crime_master_gogo"
}
