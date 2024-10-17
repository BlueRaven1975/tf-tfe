# Workspace
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
