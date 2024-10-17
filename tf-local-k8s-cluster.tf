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

