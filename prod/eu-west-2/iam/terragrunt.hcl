include "root" {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}

terraform {
  source = "git::git@github.com:your-org/terraform-modules.git//iam?ref=v1.0.0"
}

inputs = {
  environment = "prod"
  region      = "eu-west-2"

  allowed_vpc_arns = [
    dependency.network.outputs.vpc_arn
  ]

  service_roles = {
    ecs = {
      assume_role_principals = ["ecs-tasks.amazonaws.com"]
      managed_policy_arns    = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
      inline_policies        = {}
    }

    alb = {
      assume_role_principals = ["elasticloadbalancing.amazonaws.com"]
      managed_policy_arns    = []
      inline_policies        = {}
    }
  }

  tags = {
    Owner = "PlatformTeam"
    CI    = "Jenkins"
  }
}
