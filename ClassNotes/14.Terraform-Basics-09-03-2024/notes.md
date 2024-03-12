### 🚀 Terraform Class Notes

1. **Coding Blocks in Terraform**:
   - Terraform code is organized into blocks.
   - Each block has a specific purpose and syntax.
   - Examples include the `terraform` block, `provider` block, and `resource` block.

2. **Searching for Resources**:
   - To find resources in Terraform, use Google with the format "Terraform <cloud name> <resource name>". For example, "Terraform Azure resource group".
   - Open the registry link in the search results to find example code and arguments for the resource.

3. **Types of Blocks**:
   - **Terraform Block**: Defines the Terraform configuration file format and required provider versions.
   - **Required Providers Block**: Specifies the providers required by the configuration.
   - **Resource Block**: Declares a resource that exists within the infrastructure.

4. **Common Terraform Commands**:
   - `terraform init`: Initializes a Terraform working directory containing Terraform configuration files.
   - `terraform validate`: Validates the configuration files in a directory, referring to the resource configurations and verifying syntax.
   - `terraform fmt`: Rewrites Terraform configuration files to a canonical format and style.
   - `terraform plan`: Generates and shows an execution plan for the changes Terraform will make.
   - `terraform apply`: Applies the changes required to reach the desired state of the configuration.

5. **Scenarios**:
   - **Adding a New Resource Group in Code**:
     - Modify the Terraform configuration to include a new resource group definition.
     - Run `terraform plan` to preview the changes.
     - Run `terraform apply` to create the resource group.

   - **Deleting a Resource Group from Code**:
     - Remove the resource group definition from the Terraform configuration.
     - Run `terraform plan` to preview the deletion.
     - Run `terraform apply` to delete the resource group.

   - **Deleting a Resource Group from Azure Portal**:
     - Manually delete the resource group from the Azure portal.
     - Run `terraform plan` to identify the changes required in the Terraform configuration.
     - Run `terraform apply` to apply the changes and reconcile the state.

These are the basic concepts and commands to get started with Terraform. Experiment with different scenarios and explore the rich ecosystem of Terraform providers and resources.