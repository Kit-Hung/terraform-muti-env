include "parent" {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}

dependency "s3" {
  config_path = "../s3"
}

terraform {
  source = "../../../../common/modules/ecs"
}

inputs = {
  region       = "eu-west-1"
  environment  = "prod"
  cluster_name = "prod-eu-west-1-ecs"
  vpc_id       = dependency.network.outputs.vpc_id
  subnet_id    = dependency.network.outputs.public_subnet_id
  bucket_name  = dependency.s3.outputs.bucket_name
}
