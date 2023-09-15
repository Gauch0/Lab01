locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "dev-vpn" {
  source          = "./modules/pivpn"
  environment     = var.environment
}
