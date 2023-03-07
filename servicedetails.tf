# Create the Linux App Service Plan
resource "azurerm_service_plan" "plan_service"{
  #Adding explicit dependency to have the service plan created only when the resource group has been creeated.
  depends_on = [
    azurerm_resource_group.myrg
  ]
#  name                = "var.azurerm_service_plan-${random_integer.ri.result}"
  name                = "${var.azurerm_service_plan}${random_integer.ri.result}"
#  resource_group_name = "var.azurerm_resource_group-${random_integer.ri.result}"
  resource_group_name = "${var.azurerm_resource_group}${random_integer.ri.result}"
  location            = var.azurerm_resource_location
  os_type             = var.os_type
  sku_name            = var.sku_name
}
# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webappconfig" {
#  name                  = "var.azurerm_linux_web_app-${random_integer.ri.result}"
  name                = "${var.azurerm_linux_webapp}${random_integer.ri.result}"
#  resource_group_name   = "var.azurerm_resource_group-${random_integer.ri.result}"
  resource_group_name = "${var.azurerm_resource_group}${random_integer.ri.result}"
  location              = var.azurerm_resource_location
  service_plan_id       = "${azurerm_service_plan.plan_service.id}"
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }

}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = "${azurerm_linux_web_app.webappconfig.id}"
  repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}