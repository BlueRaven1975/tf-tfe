# Variables
resource "tfe_variable" "github_token" {
  category        = "terraform"
  description     = "Terraform Cloud (Full Access)"
  key             = "github_token"
  sensitive       = true
  variable_set_id = tfe_variable_set.shared_tokens.id
}

# Variable set
resource "tfe_variable_set" "shared_tokens" {
  description = "Tokens shared with multiple workspaces"
  name        = "shared-tokens"
}
