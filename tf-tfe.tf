# Workspace Variables
resource "tfe_variable" "github_token" {
  category     = "terraform"
  description  = "Terraform Cloud (Full Access)"
  key          = "github_token"
  sensitive    = true
  workspace_id = tfe_workspace.tf_tfe.id
}

resource "tfe_variable" "tfe_token" {
  category     = "terraform"
  description  = "Terraform Cloud (Full Access)"
  key          = "tfe_token"
  sensitive    = true
  workspace_id = tfe_workspace.tf_tfe.id
}

# Workspace
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
