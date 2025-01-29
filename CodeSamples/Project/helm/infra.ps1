# Set variables
$resourceGroupName = "rg-aks"
$aksClusterName = "aks"
$acrName = "dev5687reg"
$location = "centralindia"
$nodeSize = "Standard_B2s"

# Create a resource group
az group create --name $resourceGroupName --location $location

# Create the AKS Cluster with a single node
az aks create `
  --resource-group $resourceGroupName `
  --name $aksClusterName `
  --node-count 1 `
  --generate-ssh-keys `
  --node-vm-size $nodeSize `
  --location $location
  az acr create `
  --resource-group $resourceGroupName `
  --name $acrName `
  --sku Basic `
  --location $location

# Attach the ACR to the AKS Cluster (for pulling images)
az aks update `
  --resource-group $resourceGroupName `
  --name $aksClusterName `
  --attach-acr $acrName

# Get the credentials to manage the cluster
az aks get-credentials --resource-group $resourceGroupName --name $aksClusterName

# Verify the cluster by checking the nodes
kubectl get nodes
