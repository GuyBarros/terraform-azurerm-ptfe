
resource "azurerm_network_security_group" "ptfe-sg" {
  name                = "${var.demo_prefix}-sg"
  location            = var.location
 resource_group_name = azurerm_resource_group.ptfeRG.name

  tags = {
    name      =var.owner
    TTL       = var.TTL
    owner     = var.owner
 }
# SSH
  security_rule {
    name                       = "ptfe-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
# HTTP
  security_rule {
    name                       = "ptfe-http"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

# HTTPS
  security_rule {
    name                       = "ptfe-https"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

# Cluster access
  security_rule {
    name                       = "ptfe-cluster-access"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

# Installer Dashboard Access
  security_rule {
    name                       = "ptfe-installer-dashboard-access"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8800"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Application Health Check
  security_rule {
    name                       = "ptfe-application-health-check"
    priority                   = 106
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "23010"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
