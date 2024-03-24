# Class Notes - Variables in Terraform

## 1. Variables
- Variables in Terraform allow for dynamic values and reusability in your configurations.
- They help in making configurations more flexible and maintainable.

## 2. Variable Lifecycle
- **Variable Declaration**: Define variables in your Terraform configuration.
- **Variable Assignment**: Assign values to variables.
- **Variable Value Usage**: Use variables in your resources and modules.

## 3. Declaring Variables
- Variables are declared in the `variables` block in your Terraform configuration.
- Example:
  ```hcl
  variable "resource_group_name" {
    type    = string
    default = "myResourceGroup"
  }
  ```

## 4. Using Variable Values
- To use the value of a variable, reference it using `${var.variable_name}` syntax.
- Example:
  ```hcl
  resource "azurerm_resource_group" "example" {
    name     = var.resource_group_name
    location = "West Europe"
  }
  ```

## 5. Methods of Passing Variable Values
1. **Using CLI**: Pass variable values directly through the CLI using `-var` flag.
   Example: `terraform plan -var="resource_group_name=myResourceGroup"`

2. **Using CLI with -var**: Use `-var` in `terraform plan` and `terraform apply` commands.
   Example: `terraform plan -var="resource_group_name=myResourceGroup"`

3. **Using Default in Variable Block**: Set default values for variables in the variable block.
   Example:
   ```hcl
   variable "resource_group_name" {
     type    = string
     default = "myResourceGroup"
   }
   ```

4. **Using .tfvars Files**: Create `.tfvars` files and pass them using `-var-file` in `terraform plan` and `terraform apply` commands.
   Example: `terraform plan -var-file="myvars.tfvars"`

5. **Using terraform.tfvars File**: Terraform automatically loads variables from a `terraform.tfvars` file if present.
   Example:
   ```hcl
   resource_group_name = "myResourceGroup"
   ```

These methods provide flexibility in managing and passing variable values in Terraform configurations.

References: https://developer.hashicorp.com/terraform/language/values/variables#declaring-an-input-variable