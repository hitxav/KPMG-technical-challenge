resource "azurerm_resource_group" "infra" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_interface" "infra" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.infra.location
  resource_group_name = azurerm_resource_group.infra.name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "infra" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.infra.location
  resource_group_name   = azurerm_resource_group.infra.name
  network_interface_ids = [azurerm_network_interface.infra.id]
  vm_size               = var.vm_size
  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    publisher = var.storage_image_reference_publisher
    offer     = var.storage_image_reference_offer
    sku       = var.storage_image_reference_sku
    version   = "latest"
  }
  storage_os_disk {
    name              = var.storage_os_disk_name
    caching           = var.storage_os_disk_caching
    create_option     = var.storage_os_disk_create_option
    managed_disk_type = var.storage_os_disk_managed_disk_type
  }
  os_profile {
    computer_name  = var.os_profile
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}