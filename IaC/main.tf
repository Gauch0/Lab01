locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "OpenVPN" {
  source          = "./modules/OpenVPN"
  environment     = var.environment
}

module "Monitoreo" {
  source          = "./modules/OpenVPN"
  environment     = var.environment
}

module "Microservicios" {
  source          = "./modules/OpenVPN"
  environment     = var.environment
}
