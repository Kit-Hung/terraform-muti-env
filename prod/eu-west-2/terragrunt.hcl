include "parent" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../common/modules//" # 指向 Terraform 模块所在位置
}

inputs = {
  environment = "prod"
  region      = "eu-west-2"
  cidr_block  = "10.2.0.0/16"
}
