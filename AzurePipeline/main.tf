# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  version         = "=1.39.0"
  subscription_id = "9b6de23d-d9d6-472e-879a-259432656f29"
}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup1"
  location = "East US"
}
