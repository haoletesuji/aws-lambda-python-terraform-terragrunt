terraform {
  source = "../../../..//modules/buckets"
}

include {
  path = find_in_parent_folders()
}

