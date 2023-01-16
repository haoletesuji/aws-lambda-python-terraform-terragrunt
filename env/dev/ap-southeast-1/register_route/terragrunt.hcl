locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  source = "../../../..//modules/apigateway_route"
}

dependency "register" {
  config_path = "../register"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    invoke_arn    = "test"
    function_name = "test"
  }
}

dependency "apigateway" {
  config_path = "../apigateway"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    api_id        = "test"
    execution_arn = "test"
  }
}

inputs = {
  invoke_arn               = dependency.register.outputs.invoke_arn
  function_name            = dependency.register.outputs.function_name
  apigateway_id            = dependency.apigateway.outputs.api_id
  apigateway_execution_arn = dependency.apigateway.outputs.execution_arn
  method                   = "POST"
  path                     = "/users/register"
}

include {
  path = find_in_parent_folders()
}

