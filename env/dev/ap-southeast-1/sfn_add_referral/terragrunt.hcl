locals {
  template_file_path = "${get_terragrunt_dir()}/state_machine.json.tpl"
  policy_file_path   = "${get_terragrunt_dir()}/policy.json"
  role_file_path     = "${get_terragrunt_dir()}/role.json"
}

terraform {
  source = "../../../..//modules/state_machine"
}

dependency "add_referral" {
  config_path = "../add_referral"

  mock_outputs_allowed_terraform_commands = ["init", "fmt", "validate", "plan", "show"]
  mock_outputs_merge_strategy_with_state  = "shallow"
  mock_outputs = {
    invoke_arn    = "test"
    function_name = "test"
  }
}

inputs = {
  name               = "sfn-add-referral"
  template_file_path = local.template_file_path
  policy_file_path   = local.policy_file_path
  role_file_path     = local.role_file_path
  template_vars = {
    add_referral_arn = dependency.add_referral.outputs.invoke_arn
  }
  function_arns = [
    dependency.add_referral.outputs.invoke_arn
  ]
}

include {
  path = find_in_parent_folders()
}
