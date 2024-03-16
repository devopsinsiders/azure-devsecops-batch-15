# 📝 Class Notes: Understanding Terraform State Files and Azure Resource Groups

## Terraform State Files
- Terraform uses state files to keep track of managed resources.
- State files are in JSON format and store resource information, attributes, and dependencies.

## Scenarios with Azure Resource Groups
1. **Creating a Resource Group:**
   - Use the `azurerm_resource_group` resource in Terraform.
   - Define the resource group's name, location, and any additional tags.

2. **Updating a Resource Group:**
   - Modify the attributes of the `azurerm_resource_group` resource in your Terraform configuration.
   - Terraform detects the changes and plans an update to the existing resource group.

3. **Deleting a Resource Group:**
   - To delete a resource group, remove the `azurerm_resource_group` resource from your `main.tf` file.
   - Terraform will recognize the removal and plan to delete the resource group.

4. **State File Management:**
   - Store the state file remotely in a secure location, such as Azure Storage or Terraform Cloud.
   - Avoid storing the state file locally or in source control to prevent accidental exposure of sensitive information.

5. **Concurrency and Locking:**
   - Terraform uses locking mechanisms to prevent concurrent access to the state file.
   - This ensures that only one Terraform operation can modify the state file at a time, preventing conflicts.

6. **State File Inspection:**
   - Use the `terraform state` command to inspect the contents of the state file.
   - This can help troubleshoot issues and understand the current state of managed resources.

## Note
- Nadi kinare saanp hai terraform destroy chalana paap hai (Translation: There's a snake by the riverbank, running `terraform destroy` is a sin.)
