### Class Notes: Creating a Classic Build Pipeline in Azure DevOps

#### Overview
In today's class, we walked through the process of creating a classic build pipeline in Azure DevOps. We focused on adding an agent job and configuring it to run a series of PowerShell tasks. The tasks included logging into Azure using a service principal and executing Terraform commands to manage infrastructure.

#### Steps to Create a Classic Build Pipeline

1. **Create a New Build Pipeline**
   - Navigate to your Azure DevOps project.
   - Go to Pipelines > Builds.
   - Click on "New pipeline."
   - Choose "Use the classic editor" for the step-by-step creation process.
   - Select your repository and click "Continue."

2. **Add an Agent Job**
   - In the pipeline designer, you will see a default agent job (Agent job 1).
   - Ensure the agent pool is selected appropriately (e.g., Azure Pipelines).

3. **Add PowerShell Tasks**
   - Click on the "+" sign within Agent job 1 to add a new task.
   - Search for "PowerShell" and add a PowerShell task.
   - Repeat this process to add multiple PowerShell tasks for the different commands we need to run.

4. **Configure PowerShell Tasks**
   - **Task 1: Change Directory**
     - Display name: `Change Directory to s`
     - Type: Inline Script
     - Script: `cd s`

   - **Task 2: Azure Login**
     - Display name: `Azure Login`
     - Type: Inline Script
     - Script:
       ```powershell
       az login --service-principal -u <client-id> -p <client-secret> --tenant <tenant-id>
       ```
     - Replace `<client-id>`, `<client-secret>`, and `<tenant-id>` with your service principal details.

   - **Task 3: Terraform Init**
     - Display name: `Terraform Init`
     - Type: Inline Script
     - Script: `terraform init`

   - **Task 4: Terraform Plan**
     - Display name: `Terraform Plan`
     - Type: Inline Script
     - Script: `terraform plan`

   - **Task 5: Terraform Apply**
     - Display name: `Terraform Apply`
     - Type: Inline Script
     - Script: `terraform apply -auto-approve`

5. **Save and Queue the Pipeline**
   - Once all tasks are added and configured, click "Save & queue" to save your pipeline.
   - Provide a commit message and select the branch to commit to.
   - Click "Save and run" to start the pipeline execution.

6. **Monitor the Pipeline**
   - Navigate to Pipelines > Builds.
   - Click on the running pipeline to monitor the status and view logs for each task.

#### Summary
In this session, we created a classic build pipeline in Azure DevOps, added an agent job, and configured PowerShell tasks to perform essential steps for managing infrastructure using Terraform. We also demonstrated how to log in to Azure using a service principal within the pipeline.

Feel free to reach out if you have any questions or need further assistance with the pipeline configuration.