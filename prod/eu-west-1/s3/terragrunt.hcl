include "root" {
  path = find_in_parent_folders()
}

locals {
  environment = "prod"
  region      = "eu-west-1"
}

terraform {
  source = "git::git@github.com:your-org/terraform-modules.git//s3?ref=v1.2.0"
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  environment = local.environment
  region      = local.region
  bucket_name = "myapp-${local.environment}-${local.region}"
  vpc_id      = dependency.network.outputs.vpc_id
}
