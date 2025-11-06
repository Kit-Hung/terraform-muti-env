include "parent" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../common/modules/s3"
}

inputs = {
  region      = "eu-west-1"
  environment = "prod"
  bucket_name = "prod-eu-west-1-app-bucket"
}
