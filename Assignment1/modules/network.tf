resource "azurerm_virtual_network" "infra" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.infra.location
  resource_group_name = azurerm_resource_group.infra.name
}

resource "azurerm_subnet" "infra" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.infra.name
  virtual_network_name = azurerm_virtual_network.infra.name
  address_prefixes     = var.subnet_address_prefixes