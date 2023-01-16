locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  source = "../../../..//modules/apigateway"
}


inputs = {
  stage       = "${local.env_vars.locals.env}"
  environment = "${local.env_vars.locals.env}"
  name        = "serverless_lambda"
}

include {
  path = find_in_parent_folders()
}
