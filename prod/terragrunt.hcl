include "root" {
  path = find_in_parent_folders()
}

locals {
  environment = "prod"
}

inputs = {
  environment = local.environment
}
