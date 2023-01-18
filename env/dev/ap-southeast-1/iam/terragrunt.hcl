locals {
  policy_file_path      = "${get_terragrunt_dir()}/policy.json"
  role_policy_file_path = "${get_terragrunt_dir()}/role_policy.json"
}

terraform {
  source = "../../../..//modules/iam"
}

inputs = {
  name                  = "serverless_lambda"
  policy_file_path      = local.policy_file_path
  role_policy_file_path = local.role_policy_file_path
}

include {
  path = find_in_parent_folders()
}
