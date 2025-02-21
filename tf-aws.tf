# Workspace Variables
resource "tfe_variable" "aws_access_key_id" {
  category     = "terraform"
  description  = "Terraform Cloud (Full Access)"
  key          = "aws_access_key_id"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "aws_secret_access_key" {
  category     = "terraform"
  description  = "Terraform Cloud (Full Access)"
  key          = "aws_secret_access_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "db_password" {
  category     = "terraform"
  description  = "Master password for the RDS instance"
  key          = "db_password"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "db_username" {
  category     = "terraform"
  description  = "Master username for the RDS instance"
  key          = "db_username"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "middleware_api_key" {
  category     = "terraform"
  description  = "Middleware.io API key"
  key          = "middleware_api_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "tf_aws_new_relic_api_key" {
  category     = "terraform"
  description  = "New Relic API key"
  key          = "new_relic_api_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

# Workspace
resource "tfe_workspace" "tf_aws" {
  description         = "Manage my AWS infrastructure with Terraform"
  global_remote_state = true
  name                = "tf-aws"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-aws"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
