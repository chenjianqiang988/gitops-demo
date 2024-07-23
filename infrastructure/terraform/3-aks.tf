
# 生成SSH私钥
resource "tls_private_key" "example" {
  count    = tls_private_key.example == null ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 创建AKS集群
resource "azurerm_kubernetes_cluster" "aks" {
  count    = azurerm_kubernetes_cluster.aks == null ? 1 : 0
  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this[0].name
  dns_prefix          = var.dns_prefix
  kubernetes_version = local.eks_version

  default_node_pool {
    name       = "nodepool1"
    node_count = 3
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = tls_private_key.example[0].public_key_openssh
    }
  }



  tags = {
    env = local.env
  }
}
