terraform {
  required_version = ">= 1.5.0"
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.8"
    }
  }
}

data "azurerm_subscription" "current" {
}

provider "azurerm" {
  features {}
}
