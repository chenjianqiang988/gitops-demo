resource "azurerm_resource_group" "this" {
  count    = azurerm_resource_group.this == null ? 1 : 0
  name     = local.resource_group_name
  location = local.region
}
