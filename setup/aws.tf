# Retrieve TFC certificate
data "tls_certificate" "tfc_certificate" {
  url = "https://app.terraform.io"
}

// Create OIDC provider
resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = ["aws.workload.identity"]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}

// Create IAM role for TFC
resource "aws_iam_role" "tfc_role" {
  name = "tfc-demo-role"
  assume_role_policy = templatefile("./aws_config/tfc_role.tpl",
    {
      oidc_arn         = aws_iam_openid_connect_provider.tfc_provider.arn
      oidc_client_list = one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)
      tfc_organization = var.tfc_organization
      tfc_project      = var.tfc_project
      tfc_workspace    = var.tfc_workspace
  })
}

// Create IAM policy for TFC role
resource "aws_iam_policy" "tfc_policy" {
  name        = "tfc-demo-policy"
  description = "TFC run policy for demo purposes"
  policy      = file("./aws_config/tfc_policy.json")
}

// Attach IAM policy to IAM role
resource "aws_iam_role_policy_attachment" "tfc_policy_attachment" {
  role       = aws_iam_role.tfc_role.name
  policy_arn = aws_iam_policy.tfc_policy.arn
}