resource "tls_private_key" "aks" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "random_string" "dns_suffix" {
    length  = 31
    upper   = false
    special = false
}

locals {
    # must start with a letter
    dns_suffix = "a${random_string.dns_suffix.result}"
}


module "resource_group" {
    source                  = "git://github.com/LaurentLesle/azure_terraform_blueprint_modules_resource_group.git?ref=v1.0"
  
    prefix                  = "${var.prefix}"
    resource_groups         = "${map("aks", var.aks_map["resource_group_name"])}"
    location                = "${var.location}"
}