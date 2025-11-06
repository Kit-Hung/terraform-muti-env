include "parent" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../common/modules/ecs"
}

inputs = {
  region      = "eu-west-1"
  environment = "prod"
  cluster_name = "prod-eu-west-1-ecs"
}
