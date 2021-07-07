provider "azurerm" {
  features {}
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "rg" {
  name     = data.azurerm_key_vault_secret.resourcegroupname.value
  location = data.azurerm_key_vault_secret.resourcegrouplocation.value
  
  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = data.azurerm_key_vault_secret.virtualnetworkname.value
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_key_vault_secret.resourcegrouplocation.value
  resource_group_name = data.azurerm_key_vault_secret.resourcegroupname.value
  depends_on = [azurerm_resource_group.rg]

  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = data.azurerm_key_vault_secret.subnetname.value
  resource_group_name  = data.azurerm_key_vault_secret.resourcegroupname.value
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_resource_group.rg]

}

# Create public IPs
resource "azurerm_public_ip" "public_ip" {
  name                = data.azurerm_key_vault_secret.publicipname.value
  location            = data.azurerm_key_vault_secret.resourcegrouplocation.value
  resource_group_name = data.azurerm_key_vault_secret.resourcegroupname.value
  allocation_method   = "Dynamic"
  depends_on = [azurerm_resource_group.rg]
  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = data.azurerm_key_vault_secret.networksecuritygroupname.value
  location            = data.azurerm_key_vault_secret.resourcegrouplocation.value
  resource_group_name = data.azurerm_key_vault_secret.resourcegroupname.value
  depends_on = [azurerm_resource_group.rg]

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  security_rule {
    name                       = "HTTPS"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
   security_rule {
    name                       = "HTTP"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = data.azurerm_key_vault_secret.networkinterfacename.value
  location            = data.azurerm_key_vault_secret.resourcegrouplocation.value
  resource_group_name = data.azurerm_key_vault_secret.resourcegroupname.value
  depends_on = [azurerm_resource_group.rg]

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create (and display) an SSH key
resource "tls_private_key" "azurevm" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                  = data.azurerm_key_vault_secret.linuxvirtualmachinename.value
  location              = data.azurerm_key_vault_secret.resourcegrouplocation.value
  resource_group_name   = data.azurerm_key_vault_secret.resourcegroupname.value
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_DS1_v2"
  depends_on = [azurerm_resource_group.rg]

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.azurevm.public_key_openssh
  }
  tags = {
    Creater = data.azurerm_key_vault_secret.tags.value
    Environment = data.azurerm_key_vault_secret.tagenv.value
    Purpose = data.azurerm_key_vault_secret.tagpur.value
  }
}
