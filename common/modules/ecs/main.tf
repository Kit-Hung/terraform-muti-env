variable "region" {}
variable "environment" {}
variable "cluster_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "bucket_name" {}

provider "aws" {
  region  = var.region
  profile = var.environment
}

resource "aws_ecs_cluster" "main" {
  name = var.cluster_name

  tags = {
    Environment = var.environment
  }
}

resource "aws_security_group" "ecs_sg" {
  vpc_id = var.vpc_id
  name   = "${var.environment}-${var.region}-ecs-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
  }
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}
