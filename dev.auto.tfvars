resource_groups {
    "aks"             = "AKS-CLUSTER"
    "networking"      = "AKS-CLUSTER-NETWORKING"
    "security"        = "AKS-CLUSTER-SECURITY"
}

location_map {
    "region1"    = "southeastasia"
}

vnet {
    region1 {
        name                    = "vnet-aks-sg"
        address_space           = "10.30.0.0/16"
        "k8s-master"            = "10.30.0.0/25"
        "k8s-pool1"             = "10.30.254.0/24"
        "bastion1"              = "10.30.253.0/24"
    }
}


subnets {
    region1 {
        "0_k8s_master"              = "k8s-master"
        "1_k8s_pool1"               = "k8s-pool1"
        "9_bastion"                 = "bastion1"
    }
}



dns_zone {
    internal {
        name        = "aks.internal"
        zone_type   = "Private"
    }
}