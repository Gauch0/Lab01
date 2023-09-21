locals {
  Owner       = var.Owner
  environment = var.environment
    common_tags = {
        environment = local.environment
        Owner       = local.Owner
    }
}