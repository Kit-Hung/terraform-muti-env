terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = "prod" # 生产用 AWS Profile
}

module "network" {
  source     = "../common/modules/network"
  cidr_block = var.cidr_block
  env        = "prod"
  region     = var.region
}

module "s3" {
  source = "../common/modules/s3"
  env    = "prod"
  region = var.region
}
