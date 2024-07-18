locals {
  env                 = "dev"
  region              = "japaneast"
  resource_group_name = "mira-test-group"
  eks_version         = "1.29.4"
  acr_name = "acr${random_id.acr_id.hex}"
}
