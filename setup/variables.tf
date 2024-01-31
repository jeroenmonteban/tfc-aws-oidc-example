// Generate an API token at https://app.terraform.io/app/settings/tokens
variable "tfc_token" {
  description = "TFC API token"
  type        = string
}

variable "aws_setup_access_key" {
  description = "AWS access key for setup"
  type        = string
}

variable "aws_setup_secret_key" {
  description = "AWS secret key for setup"
  type        = string
}

variable "tfc_organization" {
  description = "TFC organization"
  type        = string
}

variable "tfc_project" {
  description = "TFC project"
  type        = string
}

variable "tfc_workspace" {
  description = "TFC workspace"
  type        = string
}