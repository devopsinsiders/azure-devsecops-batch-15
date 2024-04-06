# Three-Tier Architecture with Terraform

## Introduction
- The three-tier architecture is a popular model for designing applications, consisting of presentation, application (logic), and data tiers.
- Each tier serves a specific function, offering modularity, scalability, and ease of maintenance.

## Resource Group
- In Azure, a resource group is a logical container used to manage and organize Azure resources.
- It helps in the management, monitoring, and access control of related resources.
- Terraform provides capabilities to create and manage resource groups efficiently.

### Example Code
```hcl
resource "azurerm_resource_group" "my_resource_group" {
  name     = "my-resource-group"
  location = "westus2"
}
```

### Explanation
- This code snippet creates an Azure resource group named "my-resource-group" in the West US 2 region.
- The `azurerm_resource_group` resource type is used to define the resource group.
- `name` specifies the name of the resource group, and `location` specifies the Azure region where the resource group will be located.

## Virtual Network (VNet) and Subnet
- Virtual networks (VNets) in Azure allow you to securely connect Azure resources, such as virtual machines (VMs), and extend your on-premises network to the cloud.
- Subnets are subdivisions of VNets, used to organize and secure network traffic.

### Example Code
```hcl
resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name
}

resource "azurerm_subnet" "my_subnet" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.my_resource_group.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

### Explanation
- The first resource block creates a VNet named "my-vnet" with an address space of 10.0.0.0/16.
- The second resource block creates a subnet named "my-subnet" within the VNet, with an address prefix of 10.0.1.0/24.
- Both resources are associated with the previously created resource group.

## Virtual Machine (VM)
- Virtual machines are compute resources that enable you to run applications on virtualized hardware.

### Example Code
```hcl
resource "azurerm_windows_virtual_machine" "my_vm" {
  name                  = "my-vm"
  resource_group_name   = azurerm_resource_group.my_resource_group.name
  location              = azurerm_resource_group.my_resource_group.location
  size                  = "Standard_DS1_v2"
  admin_username        = "adminuser"
  admin_password        = "Password1234!"
  network_interface_ids = [azurerm_network_interface.my_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  computer_name = "my-vm"
}
```

### Explanation
- This code snippet creates a Windows virtual machine named "my-vm" in the previously defined resource group.
- It specifies the VM's size, administrator credentials, networking configuration, OS disk settings, and the source image for the VM.
- The VM is associated with a network interface defined elsewhere (`azurerm_network_interface.my_nic`).

## Result
- With the provided Terraform configuration, you can deploy a three-tier architecture on Azure, including a resource group, virtual network with subnet, and a virtual machine, enabling the deployment of scalable and modular applications.