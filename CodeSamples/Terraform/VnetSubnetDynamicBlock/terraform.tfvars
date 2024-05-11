vnets = {
  vnet1 = {
    vnetName      = "dhondhuvnet"
    location      = "westeurope"
    rg_name       = "dhondhu-rg"
    address_space = ["10.0.0.0/16"]
    subnets = {
      snet1 = {
        name           = "subnet1"
        address_prefix = "10.0.1.0/24"
      }
      snet2 = {
        name           = "subnet2"
        address_prefix = "10.0.2.0/24"
      }
      snet3 = {
        name           = "subnet3"
        address_prefix = "10.0.3.0/24"
      }
    }
  }
  vnet2 = {
    vnetName      = "dhondhuvnet2"
    location      = "westeurope"
    rg_name       = "dhondhu-rg"
    address_space = ["10.1.0.0/16"]
    subnets = {
      snet1 = {
        name           = "subnet1"
        address_prefix = "10.1.1.0/24"
      }
      snet2 = {
        name           = "subnet2"
        address_prefix = "10.1.2.0/24"
      }
    }
  }
}

