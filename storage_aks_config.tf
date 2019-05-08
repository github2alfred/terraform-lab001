resource "random_string" "stg" {
    length  = 24
    upper   = false
    special = false
}
resource "azurerm_storage_account" "stg" {
  name                     = "${random_string.stg.result}"
  resource_group_name      = "${module.resource_group.names["security"]}"
  location                 = "${var.location_map["region1"]}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_share" "testshare" {
  name = "sharename"

  resource_group_name  = "${module.resource_group.names["security"]}"
  storage_account_name = "${azurerm_storage_account.stg.name}"

  quota = 50
}