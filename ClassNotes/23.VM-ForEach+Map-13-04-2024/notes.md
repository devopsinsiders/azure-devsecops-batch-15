### Class Notes: Terraform Data Block, Output Block, and VM Configuration with Foreach and Map

#### Terraform Data Block:
- Used to query existing resources in the infrastructure.
- Syntax:
  ```hcl
  data "azurerm_subnet" "example" {
    name                 = "subnet1"
    virtual_network_name = azurerm_virtual_network.example.name
    resource_group_name  = azurerm_resource_group.example.name
  }
  ```

#### Terraform Output Block:
- Used to display information about resources.
- Syntax:
  ```hcl
  output "subnet_id" {
    value = data.azurerm_subnet.example.id
  }
  ```

#### Virtual Machine Configuration with Foreach and Map:
- Utilizes the `for_each` expression to create multiple instances based on a map of values.
- Example Code:

  ```hcl
  resource "azurerm_public_ip" "public_ip" {
    for_each            = var.linux_vms
    name                = each.value.pip_name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    allocation_method   = "Static"
  }

  resource "azurerm_network_interface" "network_interface" {
    for_each            = var.linux_vms
    name                = each.value.nic_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
      name                          = "internal"
      subnet_id                     = data.azurerm_subnet.gogo_subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
    }
  }

  resource "azurerm_linux_virtual_machine" "virtual_machine" {
    for_each                        = var.linux_vms
    name                            = each.value.vm_name
    resource_group_name             = each.value.resource_group_name
    location                        = each.value.location
    size                            = each.value.vm_size
    disable_password_authentication = false
    admin_username                  = each.value.vm_username
    admin_password                  = each.value.vm_password
    network_interface_ids = [
      azurerm_network_interface.network_interface[each.key].id,
    ]

    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  ```

- In this example, the `var.linux_vms` variable is a map containing values for each virtual machine instance, including names, resource group names, locations, sizes, usernames, and passwords.
- The `for_each` expression iterates over the `var.linux_vms` map to create multiple instances of `azurerm_public_ip`, `azurerm_network_interface`, and `azurerm_linux_virtual_machine` resources.

Remember to replace `var.linux_vms` with your actual variable name and update the values inside the map (`each.value`) according to your requirements.