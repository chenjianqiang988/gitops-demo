
data "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_name
  resource_group_name = var.resource_group_name
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "external_nginx" {
  name = "external"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = "4.11.1"

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
}
