### Class Notes: Creating a Classic Build Pipeline in Azure DevOps

#### Overview
In today's session, we covered the steps to create a classic build pipeline in Azure DevOps. We explored the options available in the Azure DevOps UI and discussed the types of jobs: agent job and agentless job. Finally, we created an agent job and set up a Terraform pipeline using the Terraform extension with an Azure service connection.

#### Steps to Create a Classic Build Pipeline

1. **Navigate to Azure DevOps:**
   - Open your Azure DevOps organization.
   - Select your project.

2. **Create a New Pipeline:**
   - Click on "Pipelines" from the left-hand menu.
   - Select "Builds".
   - Click on "New pipeline" and then choose "Use the classic editor".

3. **Select a Source:**
   - Choose the repository where your code is stored.
   - Select the correct branch and repository type (e.g., Azure Repos Git, GitHub, etc.).

4. **Configure the Pipeline:**
   - **Pipeline Name:** Give your pipeline a meaningful name.
   - **Agent Pool:** Select the appropriate agent pool for your build jobs.
   - **Options:** Explore additional options like pipeline triggers, retention, and settings.

5. **Add Jobs to the Pipeline:**
   - **Agent Job:** This job runs on an agent. It's used to execute tasks that require a build agent.
     - Click on "Add" and select "Agent Job".
     - Configure the agent job with necessary settings like agent specification (e.g., Ubuntu, Windows).
   - **Agentless Job:** This job doesn't require a build agent and runs without any agent allocation.
     - Click on "Add" and select "Agentless Job" if needed (optional for this exercise).

6. **Add Tasks to the Agent Job:**
   - Click on the "plus" (+) icon within the agent job to add tasks.
   - Search for "Terraform" and add the Terraform task to the job.

7. **Configure the Terraform Task:**
   - **Display Name:** Provide a name for the task (e.g., "Run Terraform").
   - **Terraform Version:** Select the appropriate Terraform version.
   - **Command:** Choose the Terraform command you want to run (e.g., init, plan, apply).
   - **Configuration Directory:** Specify the directory where your Terraform configuration files are located.

8. **Azure Service Connection:**
   - Ensure you have an Azure service connection set up to authenticate and authorize the pipeline to interact with your Azure resources.
   - Go to "Project Settings" > "Service connections" > "New service connection".
   - Select "Azure Resource Manager" and follow the prompts to create and configure the service connection.

9. **Save and Queue the Pipeline:**
   - Click on "Save & queue" to save your pipeline configuration and start the build process.
   - Monitor the build process and review logs for any issues or errors.

#### Summary
In this session, we successfully created a classic build pipeline in Azure DevOps. We explored the UI options available, discussed the differences between agent and agentless jobs, and created an agent job. Finally, we set up a Terraform pipeline using the Terraform extension with an Azure service connection.

Feel free to experiment with different tasks and configurations to gain a deeper understanding of the Azure DevOps build pipelines.