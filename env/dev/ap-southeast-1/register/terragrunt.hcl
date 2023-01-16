terraform {
  source = "../../../..//modules/lambda"
}

dependency "buckets" {
  config_path = "../buckets"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    lambda_bucket_id = "test"
  }
}

dependency "iam" {
  config_path = "../iam"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    exec_role_arn = ""
  }
}

inputs = {
  lambda_relative_path = "/../../"
  lambda_bucket_id     = dependency.buckets.outputs.lambda_bucket_id
  exec_role_arn        = dependency.iam.outputs.exec_role_arn
  function_name        = "register"
  handler              = "register.lambda_handler"
  runtime              = "python3.9"
  layers               = []
}

include {
  path = find_in_parent_folders()
}
