terraform {
  required_providers {
    tfe = {
      version = "~> 0.51"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

// Generate an API token at https://app.terraform.io/app/settings/tokens
provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfc_token
}

// Create AWS access credentials in the console
provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_setup_access_key
  secret_key = var.aws_setup_secret_key
}