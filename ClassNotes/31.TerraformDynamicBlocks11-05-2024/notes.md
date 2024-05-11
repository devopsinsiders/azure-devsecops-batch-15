Sure, here's an updated example using Azure Network Security Group (NSG) and rules:
## Terraform Dynamic Blocks with Azure Network Security Group (NSG)

### Introduction
- Azure Network Security Group (NSG) is a virtual firewall that controls inbound and outbound traffic to an Azure resource.
- Terraform dynamic blocks can be used to define variable numbers of NSG rules based on input data.

### Example
```hcl
variable "ports" {
  type    = list(number)
  default = [80, 443]
}

resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  
  dynamic "security_rule" {
    for_each = var.ports
    content {
      name                       = "AllowPort${security_rule.key}"
      priority                   = security_rule.key
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
```
- In this example, the number of security rules in the NSG is dynamically determined based on the `var.ports` list.

### Key Points
- Dynamic blocks in Terraform allow you to create multiple instances of nested blocks based on input data.
- Use the `for_each` argument to iterate over a collection and generate blocks dynamically.
- Each element in the collection results in the creation of a new block instance.

### Conclusion
- Terraform dynamic blocks provide a flexible way to manage Azure NSG configurations with variable rule counts.
- They enable you to create reusable and adaptable configurations that meet changing security requirements.
