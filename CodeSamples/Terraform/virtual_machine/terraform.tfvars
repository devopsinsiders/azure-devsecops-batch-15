linux_vms = {
  vm1 = {
    pip_name             = "gogo1-ip"
    nic_name             = "gogo1-nic"
    vm_name              = "gogo1-vm"
    resource_group_name  = "rg_crime_master_gogo"
    location             = "westus"
    vm_size              = "Standard_F2"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "devops-vnet2"
    vm_username          = "adminuser"
    vm_password          = "6ZyT40,Vo+c<"
  }
  vm2 = {
    pip_name             = "chachi420-ip"
    nic_name             = "chachi420-nic"
    vm_name              = "chachi420-vm"
    resource_group_name  = "rg_crime_master_gogo"
    location             = "westus"
    subnet_name          = "backend-subnet"
    virtual_network_name = "devops-vnet2"
    vm_size              = "Standard_F2"
    vm_username          = "adminuser"
    vm_password          = "6ZyT40,Vo+c<"
  }
  vm3 = {
    pip_name             = "dhondhu-ip"
    nic_name             = "dhondhu-nic"
    vm_name              = "dhondhu-vm"
    resource_group_name  = "rg_crime_master_gogo"
    location             = "westus"
    subnet_name          = "database-subnet"
    virtual_network_name = "devops-vnet2"
    vm_size              = "Standard_F2"
    vm_username          = "adminuser"
    vm_password          = "6ZyT40,Vo+c<"
  }
}
