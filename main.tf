# OAuth Client
resource "tfe_oauth_client" "this" {
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  name             = "GitHub"
  oauth_token      = var.github_token
  service_provider = "github"
}

# Organization
resource "tfe_organization" "this" {
  cost_estimation_enabled = true
  email                   = "romano.romano@gmail.com"
  name                    = "BlueRaven1975"
}

# Workspaces
resource "tfe_workspace" "tf_argocd_apps" {
  description         = "Deploy ArgoCD Applications manifests on my local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-argocd-apps"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-argocd-apps"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_aws" {
  description         = "Manage my AWS infrastructure with Terraform"
  global_remote_state = true
  name                = "tf-aws"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-aws"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
