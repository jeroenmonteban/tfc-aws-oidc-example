// Configure a custom project. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project
resource "tfe_project" "project" {
}

// Configure your workspace. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "workspace" {
}

// Configure your workspace variables. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
// Required variables can be found here: https://developer.hashicorp.com/terraform/enterprise/workspaces/dynamic-provider-credentials/aws-configuration#required-environment-variables
// Hint: the AWS Role ARN is provided as output by aws-setup
resource "tfe_variable" "provider_auth" {
}

resource "tfe_variable" "aws_role_arn" {
}