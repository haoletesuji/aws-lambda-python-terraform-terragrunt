locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  source = "../../../..//modules/apigateway"
}

dependency "lambda" {
  config_path = "../lambda"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    hello_invoke_arn    = "test"
    hello_function_name = "test"
  }
}

dependency "acm" {
  config_path = "../acm"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    certificate_arn = "test"
  }
}

inputs = {
  hello_invoke_arn    = dependency.lambda.outputs.hello_invoke_arn
  hello_function_name = dependency.lambda.outputs.hello_function_name
  stage               = "${local.env_vars.locals.env}"
  domain_name         = "${local.env_vars.locals.domain}"
  certificate_arn     = dependency.acm.outputs.certificate_arn
}

include {
  path = find_in_parent_folders()
}
