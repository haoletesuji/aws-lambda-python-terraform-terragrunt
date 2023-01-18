locals {
  env              = "dev"
  project_name     = "gatekeeper"
  state_bucket     = "demo-lambda-tfstate"
  state_lock_table = "demo-lambda-infra-state-lock"
}
