```hcl
resource "azurerm_public_ip" "public_ip" {
  for_each            = var.linux_vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "network_interface" {
  for_each            = var.linux_vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.gogo_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
  }
}
```

Explanation:

1. **`azurerm_public_ip` Resource**:
   - The `azurerm_public_ip` resource is created using a `for_each` loop over the `var.linux_vms` map. This loop iterates over each element in the `var.linux_vms` map, creating an instance of the `azurerm_public_ip` resource for each element.
   - Inside the resource block, `each.value` is used to access the current element being iterated over, and `each.value.pip_name`, `each.value.resource_group_name`, and `each.value.location` are used to set the properties of the resource instance.

2. **`azurerm_network_interface` Resource**:
   - Similar to the `azurerm_public_ip` resource, the `azurerm_network_interface` resource also uses a `for_each` loop over the `var.linux_vms` map to create instances for each element in the map.
   - Inside the `ip_configuration` block, `subnet_id` is set to `data.azurerm_subnet.gogo_subnet[each.key].id`. This retrieves the `id` attribute of the `azurerm_subnet` data source instance corresponding to the current element in the loop.
   - The `public_ip_address_id` is set to `azurerm_public_ip.public_ip[each.key].id`. This retrieves the `id` attribute of the `azurerm_public_ip` resource instance corresponding to the current element in the loop.

In summary, `each.key` is used to dynamically access specific instances of resources or data sources in Terraform when using the `for_each` meta-argument to iterate over a map or set of objects.

### Azure Database:
1. **Overview:**
   - Azure Database is a managed database service provided by Microsoft Azure.
   - It offers various database engines like SQL Server, MySQL, PostgreSQL, MariaDB, and Azure Cosmos DB.

2. **Key Features:**
   - **High Availability:** Azure Database ensures high availability with automatic backups, replication, and failover.
   - **Scalability:** It allows you to scale your database resources up or down based on your needs.
   - **Security:** Azure Database provides robust security features like encryption, firewall, and authentication mechanisms.
   - **Monitoring and Alerts:** You can monitor your database performance and set up alerts for critical metrics.
   - **Automated Patching:** Azure Database automates the patching process, ensuring your database is always up to date.

3. **Azure SQL Database:**
   - Azure SQL Database is a fully managed relational database service based on SQL Server.
   - It supports features like automated backups, built-in intelligence, and advanced security.
   - Azure SQL Database offers multiple deployment options like Single Database, Elastic Pool, and Managed Instance.

4. **Azure Cosmos DB:**
   - Azure Cosmos DB is a globally distributed, multi-model database service for scalable applications.
   - It supports multiple data models including document, key-value, graph, and column-family.
   - Azure Cosmos DB offers features like automatic indexing, tunable consistency levels, and global distribution.

5. **Azure Database for MySQL/PostgreSQL/MariaDB:**
   - These services provide fully managed MySQL, PostgreSQL, and MariaDB databases in the cloud.
   - They offer features like automatic backups, scaling, and security.

### Azure Bastion:
1. **Overview:**
   - Azure Bastion is a fully managed platform-as-a-service (PaaS) that provides secure and seamless RDP/SSH access to your virtual machines directly through the Azure Portal.
   - It eliminates the need for a public IP address or a VPN connection to access your VMs.

2. **Key Features:**
   - **Secure Access:** Azure Bastion provides secure RDP/SSH access to your VMs over SSL.
   - **No Public IP Required:** It allows you to connect to your VMs without the need for a public IP address.
   - **Integrated with Azure Portal:** You can access your VMs directly from the Azure Portal, simplifying the access process.
   - **Audit and Logging:** Azure Bastion provides audit logs for all RDP/SSH connections, enhancing security.

3. **How Azure Bastion Works:**
   - Azure Bastion deploys a bastion host in your virtual network, which acts as a jump server.
   - When you connect to a VM through Azure Bastion, your RDP/SSH traffic is securely routed through the bastion host.

4. **Configuration:**
   - To use Azure Bastion, you need to enable it for your virtual network and select the subnet where you want to deploy the bastion host.
   - You also need to ensure that the VMs you want to connect to are in the same virtual network.

5. **Benefits:**
   - **Enhanced Security:** Azure Bastion provides a more secure way to access your VMs compared to traditional methods.
   - **Simplified Access:** It simplifies the access process by eliminating the need for public IP addresses or VPN connections.
   - **Centralized Management:** You can manage access to your VMs centrally through the Azure Portal.