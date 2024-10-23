# Workspace Variables
resource "tfe_variable" "tf_new_relic_new_relic_api_key" {
  category     = "terraform"
  description  = "Terraform Cloud (Full Access)"
  key          = "new_relic_api_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

# Workspace
resource "tfe_workspace" "tf_new_relic" {
  description         = "Manage my New Relic instance with Terraform"
  global_remote_state = true
  name                = "tf-new-relic"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-new-relic"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
