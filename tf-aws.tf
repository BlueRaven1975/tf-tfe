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
