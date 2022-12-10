locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  source = "../../../..//modules/acm"
}

inputs = {
  domain_name = "${local.env_vars.locals.domain}"
}

include {
  path = find_in_parent_folders()
}
