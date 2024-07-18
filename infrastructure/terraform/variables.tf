# 定义变量
variable "aks_name" {
  description = "The name of the AKS cluster to be created."
  default     = "myAKSCluster"
}

variable "location" {
  description = "The location of the AKS cluster."
  default     = "japaneast"
}

variable "dns_prefix" {
  description = "Optional DNS prefix to use with your AKS cluster."
  default     = "myAKSClusterDNS"
}

variable "admin_username" {
  description = "User name for the Linux Virtual Machines."
  default     = "azureuser"
  
}

variable "acr_sku" {
  description = "Tier of your Azure Container Registry. Geo-replication requires Premium SKU."
  default     = "Premium"
}
