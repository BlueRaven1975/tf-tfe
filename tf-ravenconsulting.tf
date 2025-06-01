# Workspace
resource "tfe_workspace" "tf_ravenconsulting" {
  description         = "Manage Raven Consulting infrastructure with Terraform"
  global_remote_state = true
  name                = "tf-ravenconsulting"
  terraform_version   = "~> 1.12.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-ravenconsulting"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
