
module "ptfe" {
  source              = " github.com/hashicorp/terraform-azurerm-terraform-enterprise"
  resource_group_name       = azurerm_resource_group.ptfeRG.name
  domain              = var.domain
  key_vault_name  =  azurerm_key_vault.ptfe.name
  license_file  = "./guybarros.rli"
  subnet 
  tls_pfx_certificate 
  tls_pfx_certificate_password 
  virtual_network_name = azurerm_network_security_group.ptfe-vnet.name
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "ptfeRG" {
  name     = var.resource_group
 location = var.location

  tags = {
    name      =var.owner
    TTL       = var.TTL
    owner     = var.owner
 }
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.virtual_network_name}-vnet"
  location            = azurerm_resource_group.demostack.location
  address_space       = ["${var.address_space}"]
  resource_group_name = azurerm_resource_group.demostack.name

  tags = {
    name      =var.owner
    TTL       = var.TTL
    owner     = var.owner
 }
}
