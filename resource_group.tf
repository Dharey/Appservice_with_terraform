# Create the resource group
resource "azurerm_resource_group" "myrg" {
    name ="${var.azurerm_resource_group}${random_integer.ri.result}"
    location = var.azurerm_resource_location
}