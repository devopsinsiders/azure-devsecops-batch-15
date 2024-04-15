vnet_map = {
  vnet1 = {
    name                = "devops-vnet1"
    location            = "eastus"
    resource_group_name = "rg_crime_master_gogo"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "devops-vnet2"
    location            = "westus"
    resource_group_name = "rg_crime_master_gogo"
    address_space       = ["10.0.0.0/16"]
  }  
}
