include "root" {
  path = find_in_parent_folders()
}

locals {
  environment = "prod"
}

# 指定执行顺序（从早到晚）
dependency_order_groups = [
  ["*/network"],  # 第1层：network
  ["*/s3"],       # 第2层：s3
  ["*/ecs"],      # 第3层：ecs
]

inputs = {
  environment = local.environment
}
