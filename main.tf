# Organization
resource "tfe_organization" "this" {
  cost_estimation_enabled = true
  email                   = "romano.romano@gmail.com"
  name                    = "BlueRaven1975"
}

# Organization Settings
resource "tfe_organization_default_settings" "this" {
  default_execution_mode = "local"
}

# Organization Token
resource "tfe_organization_token" "this" {
}

# Workspaces
resource "tfe_workspace" "tf_argocd_apps" {
  description         = "Deploy ArgoCD Applications manifests on my local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-argocd-apps"
}

resource "tfe_workspace" "tf_github" {
  description         = "Manage my GitHub repositories via Terraform"
  global_remote_state = true
  name                = "tf-github"
}

resource "tfe_workspace" "tf_local_k8s_cluster" {
  description         = "Setup and configure a local K8s cluster with Terraform"
  global_remote_state = true
  name                = "tf-local-k8s-cluster"
}

resource "tfe_workspace" "tf_tfe" {
  description         = "Manage my Terraform Cloud instance with Terraform"
  global_remote_state = true
  name                = "tf-tfe"
}

# Workspaces Settings
resource "tfe_workspace_settings" "tf_github" {
  execution_mode = "remote"
  workspace_id   = tfe_workspace.tf_github.id
}
