subnet_map = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    name                 = "database-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet4 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet2"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet5 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet2"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet6 = {
    name                 = "database-subnet"
    resource_group_name  = "rg_crime_master_gogo"
    virtual_network_name = "devops-vnet2"
    address_prefixes     = ["10.0.5.0/24"]
  }
}
