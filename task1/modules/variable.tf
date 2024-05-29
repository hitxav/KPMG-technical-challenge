variable "prefix" {
  default = "infra"
}

variable "resource_group_name" {
  default = "infra-rg"
}

variable "location" {
  default = "West Europe"
}

variable "nic_ip_config_name" {}
variable "vm_size" {}
variable "delete_os_disk_on_termination" {
  default = false
}
variable "delete_data_disks_on_termination" {
  default = false
}
variable "storage_image_reference_publisher" {}
variable "storage_image_reference_offer" {}
variable "storage_image_reference_sku" {}
variable "storage_os_disk_name" {}
variable "storage_os_disk_caching" {}
variable "storage_os_disk_create_option" {}
variable "storage_os_disk_managed_disk_type" {}
variable "os_profile" {}
variable "admin_username" {}
variable "admin_password" {}
variable "vnet_name" {}
variable "vnet_address_space" {
  type = list
}
variable "subnet_name" {}
variable "subnet_address_prefixes" {
  type = list
}
variable "sql_server_version" {}
variable "sql_server_admin_username" {}
variable "sql_server_password" {}