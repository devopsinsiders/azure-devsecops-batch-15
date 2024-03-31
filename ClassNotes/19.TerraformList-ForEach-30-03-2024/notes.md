# Terraform List and For_each

## Introduction
- Terraform allows dynamic resource creation using lists and the `for_each` meta-argument.
- `for_each` can iterate over a map, set, or list to create multiple instances of a resource based on the elements.

## Example Usage
```hcl
variable "rg_list" {
  default = ["rg1", "rg2"]
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.rg_list)
  name     = each.key
  location = "East US"
}
```

## Explanation
- The `rg_list` variable contains a list of maps with the resource group name as key and location as value.
- `toset()` function converts the list to a set, ensuring uniqueness.
- The `for_each` argument iterates over the set, creating a resource group for each element.
- `each.key` ` refer to the current key-value pair in the iteration.

## Conclusion
- Using `for_each` with lists allows dynamic creation of resources based on the elements.
- This approach is useful for scenarios where resources need to be created based on a predefined list of values.