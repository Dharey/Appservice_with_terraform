# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.46.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
      }
    }
  }
provider "azurerm" {
  features {}
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}