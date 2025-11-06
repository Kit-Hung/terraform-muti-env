include "root" {
  path = find_in_parent_folders()
}

locals {
  environment = "dev"
}

inputs = {
  environment = local.environment
}
