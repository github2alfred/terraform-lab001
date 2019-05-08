locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}

# Create resource groups (except for AKS_Engine as it needs its own lifecycle due to the external use of aks-engine)
module "resource_group" {
    source                  = "git://github.com/LaurentLesle/azure_terraform_blueprint_modules_resource_group.git?ref=v1.0"
  
    prefix                  = "${local.prefix}"
    resource_groups         = "${var.resource_groups}"
    location                = "${var.location_map["region1"]}"
}

# Create the network environment
module "vnet_and_subnets" {
    source                  = "git://github.com/LaurentLesle/azure_terraform_blueprint_modules_networking.git?ref=v1.0"

    location                = "${var.location_map["region1"]}"
    resource_group_name     = "${module.resource_group.names["networking"]}"
    prefix                  = "${local.prefix}"
    vnet                    = "${var.vnet["region1"]}"
    subnets                 = "${var.subnets["region1"]}"
    dns_zone                = "${var.dns_zone["internal"]}"
}

module "aks_engine" {
    source                  = "modules/aks_engine"

    prefix                  = "${local.prefix}"
    location                = "${var.location_map["region1"]}"
    subnet_map              = "${module.vnet_and_subnets.subnet_map}"
    aks_map                 = "${var.aks_map}"
}



