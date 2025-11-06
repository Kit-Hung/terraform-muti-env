include "parent" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../common/modules/network"
}

inputs = {
  region      = "eu-west-1"
  environment = "prod"
  cidr_block  = "10.1.0.0/16"
}
