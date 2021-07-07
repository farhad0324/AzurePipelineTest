data "azurerm_key_vault_secret" "resourcegroupname" {
  name         = "resourcegroupname"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "resourcegrouplocation" {
  name         = "resourcegrouplocation"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "tags" {
  name         = "tags"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "tagenv" {
  name         = "tagenv"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "tagpur" {
  name         = "tagpur"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "virtualnetworkname" {
  name         = "virtualnetworkname"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "subnetname" {
  name         = "subnetname"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "publicipname" {
  name         = "publicipname"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "networksecuritygroupname" {
  name         = "networksecuritygroupname"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "networkinterfacename" {
  name         = "networkinterfacename"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}

data "azurerm_key_vault_secret" "linuxvirtualmachinename" {
  name         = "linuxvirtualmachinename"
  key_vault_id = "/subscriptions/9b6de23d-d9d6-472e-879a-259432656f29/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.KeyVault/vaults/terraformkeyvault2"
}