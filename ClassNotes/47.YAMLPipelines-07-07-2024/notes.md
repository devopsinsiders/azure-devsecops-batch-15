### Azure YAML Pipelines: Detailed Notes

Azure YAML pipelines provide a way to define CI/CD pipelines in a version-controlled manner using YAML (Yet Another Markup Language). This approach allows teams to keep their pipeline configurations alongside their application code, enabling better collaboration, traceability, and versioning. Here’s a detailed explanation:

#### Key Concepts

1. **Pipeline**: A pipeline is a set of steps that automate the process of getting code from source control, building it, testing it, and deploying it.

2. **Triggers**: Triggers specify the events that cause a pipeline to run, such as code changes in a repository.

3. **Pools**: Pools specify the agent(s) on which the pipeline jobs will run.

4. **Steps**: Steps are individual tasks or scripts that perform specific actions in the pipeline.

5. **Variables**: Variables allow you to parameterize your pipeline. They can store values that can be reused in multiple places.

6. **Stages and Jobs**: Pipelines can be broken down into stages and jobs. Stages represent major divisions of the pipeline (like build and deploy), and jobs are units of work within those stages.

#### Example Pipeline Code Explanation

```yaml
---
name: ABCD-Pipelines

trigger: 
  branches: 
    include: 
    - main
    - master
    exclude: 
    - feature/*
  paths: 
    include: 
    - environments/dev
    exclude: 
    - environments/prod

pool: Default

steps: 
- task: TerraformInstaller@1
  displayName: "Terraform Tool Installer"
  inputs:
    terraformVersion: 'latest'

- task: TerraformTaskV4@4
  displayName: 'Terraform Init'
  inputs:
    provider: 'azurerm'
    command: 'init'
    workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
    backendServiceArm: 'tasleem-sc'
    backendAzureRmResourceGroupName: 'strg'
    backendAzureRmStorageAccountName: 'storagkhan'
    backendAzureRmContainerName: 'don2'
    backendAzureRmKey: 'don.terraform.tfstate'

- task: TerraformTaskV4@4
  displayName: 'Terraform Plan'
  inputs:
    provider: 'azurerm'
    command: 'plan'
    workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
    environmentServiceNameAzureRM: 'tasleem-sc'

- task: TerraformTaskV4@4
  displayName: 'Terraform Apply'
  inputs:
    provider: 'azurerm'
    command: 'apply'
    workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
    environmentServiceNameAzureRM: 'tasleem-sc'
```

#### Code Breakdown

1. **Pipeline Name**
   ```yaml
   name: ABCD-Pipelines
   ```
   - This sets the name of the pipeline to `ABCD-Pipelines`.

2. **Trigger Configuration**
   ```yaml
   trigger: 
     branches: 
       include: 
       - main
       - master
       exclude: 
       - feature/*
     paths: 
       include: 
       - environments/dev
       exclude: 
       - environments/prod
   ```
   - **branches**: Specifies that the pipeline should trigger on changes to `main` and `master` branches, but not on `feature/*` branches.
   - **paths**: Specifies that the pipeline should trigger on changes within the `environments/dev` directory but not `environments/prod`.

3. **Pool**
   ```yaml
   pool: Default
   ```
   - This sets the agent pool to `Default`, meaning the tasks will run on the default agents available in the Azure DevOps project.

4. **Steps**
   - **Terraform Installer Task**
     ```yaml
     - task: TerraformInstaller@1
       displayName: "Terraform Tool Installer"
       inputs:
         terraformVersion: 'latest'
     ```
     - Installs the latest version of Terraform tool.

   - **Terraform Init Task**
     ```yaml
     - task: TerraformTaskV4@4
       displayName: 'Terraform Init'
       inputs:
         provider: 'azurerm'
         command: 'init'
         workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
         backendServiceArm: 'tasleem-sc'
         backendAzureRmResourceGroupName: 'strg'
         backendAzureRmStorageAccountName: 'storagkhan'
         backendAzureRmContainerName: 'don2'
         backendAzureRmKey: 'don.terraform.tfstate'
     ```
     - **task**: Specifies the task to run, in this case, a Terraform task (version 4).
     - **displayName**: A friendly name for the task.
     - **inputs**: Parameters for the task.
       - **provider**: Specifies the Terraform provider, here `azurerm` for Azure.
       - **command**: The Terraform command to run (`init`).
       - **workingDirectory**: The directory containing the Terraform configuration.
       - **backendServiceArm**: Azure service connection name.
       - **backendAzureRmResourceGroupName**: Azure resource group for storing state.
       - **backendAzureRmStorageAccountName**: Azure storage account for state files.
       - **backendAzureRmContainerName**: Azure storage container for state files.
       - **backendAzureRmKey**: Key (filename) for the state file.

   - **Terraform Plan Task**
     ```yaml
     - task: TerraformTaskV4@4
       displayName: 'Terraform Plan'
       inputs:
         provider: 'azurerm'
         command: 'plan'
         workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
         environmentServiceNameAzureRM: 'tasleem-sc'
     ```
     - Runs the `terraform plan` command to create an execution plan.
     - **environmentServiceNameAzureRM**: Azure service connection name.

   - **Terraform Apply Task**
     ```yaml
     - task: TerraformTaskV4@4
       displayName: 'Terraform Apply'
       inputs:
         provider: 'azurerm'
         command: 'apply'
         workingDirectory: '$(System.DefaultWorkingDirectory)/environments/dev'
         environmentServiceNameAzureRM: 'tasleem-sc'
     ```
     - Runs the `terraform apply` command to apply the planned changes.
     - **environmentServiceNameAzureRM**: Azure service connection name.

### Summary

This Azure YAML pipeline defines a CI/CD process that triggers on changes to specific branches and paths, installs the latest Terraform tool, initializes the Terraform configuration, creates a plan, and applies the configuration. Each step is carefully configured to use specific Azure resources and directories to ensure a smooth deployment process.