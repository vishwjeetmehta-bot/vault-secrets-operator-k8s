terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vault_rg" {
  name     = "rg-vault-production"
  location = "eastus"
}

resource "azurerm_key_vault" "vault_unseal" {
  name                     = "kv-vault-unseal-prod"
  location                 = azurerm_resource_group.vault_rg.location
  resource_group_name      = azurerm_resource_group.vault_rg.name
  tenant_id                = "00000000-0000-0000-0000-000000000000"
  sku_name                 = "standard"
  purge_protection_enabled = true
}

resource "azurerm_key_vault_key" "unseal_key" {
  name         = "vault-auto-unseal-key"
  key_vault_id = azurerm_key_vault.vault_unseal.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]
}
