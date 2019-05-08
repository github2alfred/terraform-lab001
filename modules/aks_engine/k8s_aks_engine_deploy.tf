
# Generate k8s json template
resource "null_resource" "k8s_aks_engine_generate" {
  triggers = {
    args = "${join(" ", local.args)}"
  }
  provisioner "local-exec" {
    command = "modules/aks_engine/k8s_aks_engine_deploy.sh ${join(" ", local.args)}"

    interpreter = ["/bin/bash", "-c"]
  }

  depends_on = [
    "null_resource.k8s_aks_engine_template",
    "module.resource_group"
  ]
}


locals {
  args = [
    "${local.dns_suffix}",
    "${module.resource_group.names["aks"]}"
  ]
}
