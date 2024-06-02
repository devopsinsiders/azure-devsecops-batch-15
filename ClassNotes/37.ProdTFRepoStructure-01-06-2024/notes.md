# Terraform Folder Structure for Multiple Environments

## Overview
Terraform is an infrastructure as code (IaC) tool that allows you to define and manage infrastructure resources in a declarative manner. When managing multiple environments (e.g., development, QA, and production), it’s essential to structure your Terraform code in a way that promotes reusability, maintainability, and clear separation of concerns. A common and effective approach is to use a folder structure that separates environment-specific configurations from reusable modules.

## Recommended Folder Structure

```
terraform-project/
├── environments/
│   ├── dev/
│   │   └── main.tf
│   ├── qa/
│   │   └── main.tf
│   └── prod/
│       └── main.tf
└── modules/
    ├── azurerm_rg/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── azurerm_vnet/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── azurerm_subnet/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

### Detailed Breakdown

1. **Environments Folder**:
   - **dev, qa, prod**: Each environment (development, QA, production) has its own directory containing a `main.tf` file. This file is responsible for defining the environment-specific infrastructure by referencing modules and passing environment-specific variables.
     ```hcl
     // dev/main.tf
     provider "azurerm" {
       features {}
     }

     module "resource_group" {
       source       = "../../modules/azurerm_rg"
       rg_name      = "dev-rg"
       rg_location  = "East US"
     }

     module "virtual_network" {
       source         = "../../modules/azurerm_vnet"
       vnet_name      = "dev-vnet"
       vnet_location  = "East US"
       vnet_address_space = ["10.0.0.0/16"]
     }

     module "subnet" {
       source         = "../../modules/azurerm_subnet"
       subnet_name    = "dev-subnet"
       vnet_name      = module.virtual_network.vnet_name
       subnet_address = "10.0.1.0/24"
     }
     ```

2. **Modules Folder**:
   - **azurerm_rg**: Module for Azure Resource Group.
     ```hcl
     // modules/azurerm_rg/main.tf
     resource "azurerm_resource_group" "rg" {
       name     = var.rg_name
       location = var.rg_location
     }

     // modules/azurerm_rg/variables.tf
     variable "rg_name" {
       description = "The name of the resource group"
       type        = string
     }

     variable "rg_location" {
       description = "The location of the resource group"
       type        = string
     }

     // modules/azurerm_rg/outputs.tf
     output "rg_name" {
       value = azurerm_resource_group.rg.name
     }
     ```
   - **azurerm_vnet**: Module for Azure Virtual Network.
     ```hcl
     // modules/azurerm_vnet/main.tf
     resource "azurerm_virtual_network" "vnet" {
       name                = var.vnet_name
       location            = var.vnet_location
       address_space       = var.vnet_address_space
       resource_group_name = module.rg_name
     }

     // modules/azurerm_vnet/variables.tf
     variable "vnet_name" {
       description = "The name of the virtual network"
       type        = string
     }

     variable "vnet_location" {
       description = "The location of the virtual network"
       type        = string
     }

     variable "vnet_address_space" {
       description = "The address space of the virtual network"
       type        = list(string)
     }

     // modules/azurerm_vnet/outputs.tf
     output "vnet_name" {
       value = azurerm_virtual_network.vnet.name
     }
     ```
   - **azurerm_subnet**: Module for Azure Subnet.
     ```hcl
     // modules/azurerm_subnet/main.tf
     resource "azurerm_subnet" "subnet" {
       name                 = var.subnet_name
       resource_group_name  = var.vnet_name
       virtual_network_name = var.vnet_name
       address_prefixes     = [var.subnet_address]
     }

     // modules/azurerm_subnet/variables.tf
     variable "subnet_name" {
       description = "The name of the subnet"
       type        = string
     }

     variable "vnet_name" {
       description = "The name of the virtual network"
       type        = string
     }

     variable "subnet_address" {
       description = "The address prefix of the subnet"
       type        = string
     }

     // modules/azurerm_subnet/outputs.tf
     output "subnet_name" {
       value = azurerm_subnet.subnet.name
     }
     ```

## Trunk-Based Branching Strategy

Trunk-based development is a version control strategy where developers collaborate on code in a single branch called the "trunk" (often the `main` branch). Feature branches are short-lived and are frequently merged back into the main branch.

## Key Concepts

1. **Main Branch**:
   - The `main` branch contains the stable codebase.
   - Only thoroughly tested and reviewed code gets merged into the `main` branch.

2. **Feature Branches**:
   - Developers create feature branches from the `main` branch to work on new features, bug fixes, or experiments.
   - Feature branches are short-lived and regularly synced with the `main` branch to avoid significant drift.
   - Once the feature is complete and tested, it is merged back into the `main` branch.

3. **Continuous Integration (CI)**:
   - A CI pipeline is set up to automatically build, test, and validate the code in the `main` branch.
   - Ensures that the code in the `main` branch is always in a deployable state.

4. **Merging**:
   - Merging is done frequently, ideally daily, to keep the `main` branch up-to-date.
   - Conflicts are resolved promptly to maintain a smooth workflow.

## Workflow Example

1. **Creating a Feature Branch**:
   - A developer creates a new branch from `main` to work on a feature.
     ```bash
     git checkout main
     git pull origin main
     git checkout -b feature/new-feature
     ```

2. **Developing the Feature**:
   - The developer works on the feature, committing changes regularly.
     ```bash
     git add .
     git commit -m "Add new feature"
     ```

3. **Syncing with Main**:
   - Periodically, the developer pulls the latest changes from `main` into the feature branch to resolve conflicts early.
     ```bash
     git checkout main
     git pull origin main
     git checkout feature/new-feature
     git merge main
     ```

4. **Merging the Feature**:
   - Once the feature is complete and tested, the developer merges it back into `main`.
     ```bash
     git checkout main
     git pull origin main
     git merge feature/new-feature
     git push origin main
     ```

5. **Continuous Integration**:
   - The CI pipeline runs automated tests on the `main` branch to ensure stability.
   - If tests pass, the new code is considered stable and ready for deployment.

This strategy ensures that the `main` branch is always in a deployable state, with frequent, small merges that minimize integration challenges. It complements the structured Terraform codebase by maintaining a clear, stable code progression for different environments.