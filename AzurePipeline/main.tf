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
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup1"
  location = "East US"
}
