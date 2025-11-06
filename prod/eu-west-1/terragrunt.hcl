include "parent" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../common/modules//" # 指向 Terraform 模块所在位置
}

inputs = {
  environment = "prod"
  region      = "eu-west-1"
  cidr_block  = "10.1.0.0/16"
}
