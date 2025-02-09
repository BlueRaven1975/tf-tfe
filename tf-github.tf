# Workspace Variables
resource "tfe_variable" "actions_sa_key" {
  category     = "terraform"
  description  = "GitHub Actions Service Account Key"
  key          = "actions_sa_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_github.id
}

resource "tfe_variable" "dockerhub_token" {
  category     = "terraform"
  description  = "Docker Hub API Token"
  key          = "dockerhub_token"
  sensitive    = true
  workspace_id = tfe_workspace.tf_github.id
}

resource "tfe_variable" "dockerhub_username" {
  category     = "terraform"
  description  = "Docker Hub User Name"
  key          = "dockerhub_username"
  sensitive    = true
  workspace_id = tfe_workspace.tf_github.id
}

resource "tfe_variable" "ec2_host" {
  category     = "terraform"
  description  = "EC2 Instance Hostname"
  key          = "ec2_host"
  sensitive    = true
  workspace_id = tfe_workspace.tf_github.id
}

resource "tfe_variable" "ec2_user" {
  category     = "terraform"
  description  = "EC2 Instance User Name"
  key          = "ec2_user"
  sensitive    = true
  workspace_id = tfe_workspace.tf_github.id
}

# Workspace
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

# Workspace Variable Sets
resource "tfe_workspace_variable_set" "tf_github" {
  variable_set_id = tfe_variable_set.shared_tokens.id
  workspace_id    = tfe_workspace.tf_github.id
}
