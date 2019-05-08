data "template_file" "k8s" {
  template = "${file("template/k8s_vmss.tpl")}"

  vars {
    k8s_orchestrator_release      = "1.14"
    k8s_orchestrator_version      = "1.14.0"
    k8s_dns_prefix                = "${local.dns_suffix}"
    k8s_master_family_type        = "Standard_D2s_v3"
    k8s_agentpool_family_type     = "Standard_D2s_v3"
    k8s_admin_username            = "k8sadmin"
    k8s_agent_pool_name           = "microservice"
    vnet_cidr                     = "10.30.0.0/16"
    first_master_ip               = "${cidrhost("10.30.0.0/16", 4)}"
    vnet_id_mgmt                  = "${module.vnet_and_subnets.subnet_map["k8s-master"]}"
    vnet_id_pool1                 = "${module.vnet_and_subnets.subnet_map["k8s-pool1"]}"
    # k8s_public_key_openssh        = "${tls_private_key.aks.public_key_openssh}"
  }
}

resource "null_resource" "k8s_aks_engine_template" {

  triggers = {
    args = "${file("template/k8s_vmss.tpl")}"
  }

  provisioner "local-exec" {
    command = "cat > ./_run/${local.dns_suffix}.json <<EOL\n${data.template_file.k8s.rendered}\nEOL"
  }
}
