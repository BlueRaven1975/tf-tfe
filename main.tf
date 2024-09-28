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

# Organization Settings
resource "tfe_organization_default_settings" "this" {
  default_execution_mode = "remote"
}

# Organization Token
resource "tfe_organization_token" "this" {
}

# Workspaces
resource "tfe_workspace" "tf_argocd_apps" {
  description         = "Deploy ArgoCD Applications manifests on my local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-argocd-apps"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-argocd-apps"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_github" {
  description         = "Manage my GitHub repositories via Terraform"
  global_remote_state = true
  name                = "tf-github"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-github"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_local_k8s_cluster" {
  description         = "Setup and configure a local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-local-k8s-cluster"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-local-k8s-cluster"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

resource "tfe_workspace" "tf_tfe" {
  description         = "Manage my Terraform Cloud instance with Terraform"
  global_remote_state = true
  name                = "tf-tfe"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-tfe"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}

# Workspaces Settings
resource "tfe_workspace_settings" "tf_argocd_apps" {
  execution_mode = "remote"
  workspace_id   = tfe_workspace.tf_argocd_apps.id
}

resource "tfe_workspace_settings" "tf_github" {
  execution_mode = "remote"
  workspace_id   = tfe_workspace.tf_github.id
}

resource "tfe_workspace_settings" "tf_local_k8s_cluster" {
  execution_mode = "remote"
  workspace_id   = tfe_workspace.tf_local_k8s_cluster.id
}

resource "tfe_workspace_settings" "tf_tfe" {
  execution_mode = "remote"
  workspace_id   = tfe_workspace.tf_tfe.id
}
