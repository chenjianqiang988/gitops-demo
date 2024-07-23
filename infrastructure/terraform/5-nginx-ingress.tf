provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.aks[0].kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.aks[0].kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.aks[0].kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks[0].kube_config[0].cluster_ca_certificate)
  }
}

resource "helm_release" "external_nginx" {
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
  name = "ingress-nginx"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = "4.11.1"

  values = [file("${path.module}/values/ingress.yaml")]
}
