locals {
    prefix = "${random_string.prefix.result}-"
    # must start with a letter
    dns_suffix = "a${random_string.dns_suffix.result}"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
resource "azurerm_resource_group" "rg" {
    name        = "${local.prefix}aks1"
    location    = "southeastasia"
}

resource "tls_private_key" "aks" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_string" "dns_suffix" {
    length  = 31
    upper   = false
    special = false
}


