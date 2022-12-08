terraform {
  source = "../../../..//modules/apigateway"
}

dependency "lambda" {
  config_path = "../lambda"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    hello_invoke_arn = "test"
    hello_function_name = "test"
  }
}

inputs = {
  hello_invoke_arn    = dependency.lambda.outputs.hello_invoke_arn
  hello_function_name = dependency.lambda.outputs.hello_function_name
}

include {
  path = find_in_parent_folders()
}
