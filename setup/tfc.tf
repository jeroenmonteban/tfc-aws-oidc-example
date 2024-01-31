// Configure a custom project. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project
resource "tfe_project" "project" {
  name         = var.tfc_project
  organization = var.tfc_organization
}

// Configure your workspace. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "workspace" {
  name         = var.tfc_workspace
  organization = var.tfc_organization
  project_id   = tfe_project.project.id
  description  = "Workspace with dynamic credentials provisioned via Terraform"
}

// Configure your workspace variables. See https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
// Required variables can be found here: https://developer.hashicorp.com/terraform/enterprise/workspaces/dynamic-provider-credentials/aws-configuration#required-environment-variables
// Hint: the AWS Role ARN is provided as output by aws-setup
resource "tfe_variable" "provider_auth" {
  workspace_id = tfe_workspace.workspace.id
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  description  = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "aws_role_arn" {
  workspace_id = tfe_workspace.workspace.id
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = aws_iam_role.tfc_role.arn
  category     = "env"
  description  = "The AWS role arn runs will use to authenticate."
}