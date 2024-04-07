resource "azurerm_public_ip" "pip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = "babitajee-rg"
  location            = "Central India"
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = "frontend-nic"
  location            = "Central India"
  resource_group_name = "babitajee-rg"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/dfc51e53-38c1-4d27-813f-b0ee11f6a7c4/resourceGroups/babitajee-rg/providers/Microsoft.Network/virtualNetworks/billorani/subnets/frontend"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "frontendvm" {
  name                = "frontend-machine"
  resource_group_name = "babitajee-rg"
  location            = "Central India"
  size                = "Standard_DS1_v2"
  admin_username      = "devopsinsiders"
  admin_password = "3@O!-LAc2j:6"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = "30"
    name = "frontend-disk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
