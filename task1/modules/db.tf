resource "azurerm_sql_server" "infra" {
  name                         = "${var.prefix}-sql_server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_username
  administrator_login_password = var.sql_server_password
}


resource "azurerm_sql_database" "infra" {
  name                = "myexamplesqldatabase"
  resource_group_name = azurerm_resource_group.infra.name
  location            = azurerm_resource_group.infra.location
  server_name         = azurerm_sql_server.infra.name

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}