# 引用上层配置（包含 remote_state, provider, 环境变量）
include "root" {
  path = find_in_parent_folders()
}

locals {
  environment = "prod"
  region      = "eu-west-1"
}

terraform {
  source = "git::git@github.com:your-org/terraform-modules.git//network?ref=v1.2.0"
}

inputs = {
  environment = local.environment
  region      = local.region
  vpc_cidr    = "10.0.0.0/16"
}
