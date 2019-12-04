resource "random_id" "keyvault" {
  byte_length = 4
}

resource "random_id" "keyvaultkey" {
  byte_length = 4
}

resource "azurerm_key_vault" "ptfe" {
  name                        = "ptfe-${random_id.keyvault.hex}"
  location                    = azurerm_resource_group.ptfeRG.location
  resource_group_name         = azurerm_resource_group.ptfeRG.name
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id

  sku_name  = "standard"
  

  tags = {
    name      =var.owner
    TTL       = var.TTL
    owner     = var.owner
 }
}

