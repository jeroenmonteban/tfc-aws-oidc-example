// Provide your TFC organization and workspace here
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "my-org-jm"
    workspaces {
      name = "demo-workspace"
    }
  }
}

// Do not add your AWS credentials here. They will be automatically generated via Terraform Cloud
provider "aws" {
  region = "eu-central-1"
}