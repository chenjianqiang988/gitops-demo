# 生成唯一ID
resource "random_id" "acr_id" {
  keepers = {
    my_id = "static_id"
  }
  byte_length = 8
}
# 创建ACR
resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  location            = local.region
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.acr_sku
  admin_enabled       = false
}
