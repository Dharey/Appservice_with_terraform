# 1. Resource Group Name
variable "azurerm_resource_group" {
  description = "Resource Group Name"
  type = string
  default = "newRG"
}

# 2. Resource Group Location
variable "azurerm_resource_location" {
  description = "Resource Group Location"
  type = string
  default = "East US"
}

# 3. Name of the App Service
variable "azurerm_linux_webapp" {
  type        = string
  default     = "myappservice"
  description = "This is the name of the App Service"
}

# 4. Namer of the App Service Plan ID
variable "azurerm_service_plan" {
  type        = string
  default     = "devwebapp"
  description = "This is the Linux App Service Plan"
}

# 5. The OS type
variable os_type {
  type        = string
  default     = "Linux"
  description = "OS type for the App Service"
}

# 6. The SKU Version
variable sku_name {
  type        = string
  default     = "B1"
  description = "SKU type for the App service"
}

# 7. Prefix
variable "prefix" {
  default = "TF"
}

/*# 8. Random string
variable "random_string" {
  default = ""
} */