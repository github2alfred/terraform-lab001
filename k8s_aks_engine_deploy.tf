
# Generate k8s json template
resource "null_resource" "k8s_aks_engine_generate" {
  triggers = {
    args = "${join(" ", local.args)}"
  }
  provisioner "local-exec" {
    command = "./k8s_aks_engine_deploy.sh ${join(" ", local.args)}"

    interpreter = ["/bin/bash", "-c"]
  }

  depends_on = [
    "null_resource.k8s_aks_engine_template",
  ]
}


locals {
  args = [
    "${local.dns_suffix}",
    "${azurerm_resource_group.rg.name}"
  ]
}
