# Organization
resource "tfe_organization" "this" {
  email = "romano.romano@gmail.com"
  name  = "BlueRaven1975"
}

# Organization Settings
resource "tfe_organization_default_settings" "this" {
  default_execution_mode = "local"
}

# Workspaces
resource "tfe_workspace" "tf_argocd_apps" {
  description = "Deploy ArgoCD Applications manifests on my local K8s cluster with Terraform"
  name        = "tf-argocd-apps"
}

resource "tfe_workspace" "tf_github" {
  description = "Manage my GitHub repositories via Terraform"
  name        = "tf-github"
}

resource "tfe_workspace" "tf_local_k8s_cluster" {
  description = "Setup and configure a local K8s cluster with Terraform"
  name        = "tf-local-k8s-cluster"
}

resource "tfe_workspace" "tf_tfe" {
  description = "Manage my Terraform Cloud instance with Terraform"
  name        = "tf-tfe"
}
