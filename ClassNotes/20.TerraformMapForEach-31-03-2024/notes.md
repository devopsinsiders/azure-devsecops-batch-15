# Terraform: Using `map` and `for_each`

## Introduction
- Terraform allows you to use maps with the `for_each` meta-argument to create multiple instances of a resource based on a map.
- This is useful for creating resources with dynamic names or configurations.

## Example Code
```hcl
resource "azurerm_resource_group" "rg" {
  for_each = {
    monu-rg = "westus"
    sonu-rg = "centralindia"
    kalu-rg = "eastus"
    tonu-rg = "canadacentral"
    lalu-rg = "southindia"
  }
  name     = each.key
  location = each.value
}
```

## Explanation
- In this example, we have a map where the keys are the names of the resource groups and the values are the locations.
- The `for_each` meta-argument iterates over each key-value pair in the map, creating a separate instance of the `azurerm_resource_group` resource for each pair.
- Inside the resource block, we use `each.key` to access the current key (resource group name) and `each.value` to access the current value (location).

## Result
- This will create five resource groups in Azure, each with a different name and location, as specified in the map.

## Notes
- When using `for_each`, Terraform treats the resource as a collection of instances rather than a single instance, so you cannot reference it directly using `azurerm_resource_group.rg`.
- Instead, you can use `azurerm_resource_group.rg["monu-rg"]` to reference the resource group named "monu-rg", for example.

# Terraform: Using Complex Maps with `for_each`

## Introduction
- In Terraform, you can use complex maps with nested structures along with the `for_each` meta-argument to create multiple instances of a resource with different configurations.

## Example Code
```hcl
resource "azurerm_resource_group" "resource_groups" {
  for_each = {
    rg1 = {
      rg_name     = "monu-rg"
      rg_location = "westus"
    }
    rg2 = {
      rg_name     = "tonu-rg"
      rg_location = "eastus"
    }
    rg3 = {
      rg_name     = "sonu-rg"
      rg_location = "centralindia"
    }
    rg4 = {
      rg_name     = "saurabhsingh-rg"
      rg_location = "centralindia"
    }
    rg5 = {
      rg_name     = "rohit-rg"
      rg_location = "centralindia"
    }
  }

  name     = each.value.rg_name
  location = each.value.rg_location
}
```

## Explanation
- In this example, we have a complex map where each key is a unique identifier for a resource group (`rg1`, `rg2`, etc.), and each value is a nested map containing the name and location of the resource group.
- The `for_each` meta-argument iterates over each key-value pair in the complex map, creating a separate instance of the `azurerm_resource_group` resource for each pair.
- Inside the resource block, we use `each.value.rg_name` to access the name of the resource group and `each.value.rg_location` to access the location.

## Result
- This will create five resource groups in Azure, each with a different name and location, as specified in the complex map.

## Notes
- Complex maps allow you to define more structured data for configuring resources, making it easier to manage and maintain configurations.
- When using complex maps with `for_each`, Terraform treats each key-value pair as a separate instance, allowing you to define unique configurations for each instance.
