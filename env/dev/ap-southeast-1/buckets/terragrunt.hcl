terraform {
  source = "../../../..//modules/buckets"
}

inputs = {
  prefix = "learn-terraform-functions"
}

include {
  path = find_in_parent_folders()
}

