terraform {
  required_version = "~> 1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

terraform {
  cloud {

    organization = "dev_1etss"
    workspaces {
      name = "tfci"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  resource "azurerm_resource_group" "rg" {
    name     = "1-7f429557-playground-sandbox"
    location = "southcentralus"
  }

resource "azurerm_storage_account" "storageaccount" {
  name                     = "storage68288b76"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}