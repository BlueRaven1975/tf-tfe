# Workspace Variables
resource "tfe_variable" "aws_access_key_id" {
  category     = "terraform"
  description  = "Terraform Cloud service account AWS access key ID"
  key          = "aws_access_key_id"
  sensitive    = true
  workspace_id = tfe_workspace.tf_aws.id
}

resource "tfe_variable" "aws_secret_access_key" {
  category     = "terraform"
  description  = "Terraform Cloud service account AWS secret access key"
  key          = "aws_secret_access_key"
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
