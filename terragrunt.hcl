remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region  = var.region
  profile = var.environment
}
EOF
}
