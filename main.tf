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

# Variable sets
resource "tfe_variable_set" "this" {
  global = true
  name   = "tokens"
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

resource "tfe_workspace" "tf_github" {
  description         = "Manage my GitHub repositories via Terraform"
  global_remote_state = true
  name                = "tf-github"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-github"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_local_k8s_cluster" {
  description         = "Setup and configure a local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-local-k8s-cluster"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-local-k8s-cluster"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_tfe" {
  description         = "Manage my Terraform Cloud instance with Terraform"
  global_remote_state = true
  name                = "tf-tfe"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-tfe"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
