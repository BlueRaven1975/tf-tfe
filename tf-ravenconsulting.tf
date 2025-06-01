# Workspace Variables
resource "tfe_variable" "tf_ravenconsulting_aws_access_key_id" {
  category     = "terraform"
  description  = "Terraform Cloud AWS Access Key ID"
  key          = "aws_access_key_id"
  sensitive    = true
  workspace_id = tfe_workspace.tf_ravenconsulting.id
}

resource "tfe_variable" "tf_ravenconsulting_aws_secret_access_key" {
  category     = "terraform"
  description  = "Terraform Cloud AWS Secret Access Key"
  key          = "aws_secret_access_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_ravenconsulting.id
}

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
