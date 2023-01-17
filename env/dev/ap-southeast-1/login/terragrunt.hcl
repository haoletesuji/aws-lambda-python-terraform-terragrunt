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

dependency "shared_layer" {
  config_path = "../shared_layer"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    layer_arn = ""
  }
}

dependency "packages_layer" {
  config_path = "../packages_layer"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    layer_arn = ""
  }
}

inputs = {
  lambda_relative_path = "/../../"
  lambda_bucket_id     = dependency.buckets.outputs.lambda_bucket_id
  exec_role_arn        = dependency.iam.outputs.exec_role_arn
  function_name        = "login"
  handler              = "login.lambda_handler"
  runtime              = "python3.9"
  layers               = [dependency.shared_layer.outputs.layer_arn, dependency.packages_layer.outputs.layer_arn]
  environment_variables = {
    "ALLOWED_METHODS" = "OPTIONS,POST,GET,PUT,PATCH,DELETE",
  }
  memory_size    = 256
  warmup_enabled = true
  schedule       = "rate(5 minutes)"
}

include {
  path = find_in_parent_folders()
}
