# Workspace Variables
resource "tfe_variable" "cloudflare_api_key" {
  category     = "terraform"
  description  = "Cloudflare API key"
  key          = "cloudflare_api_key"
  sensitive    = true
  workspace_id = tfe_workspace.tf_cloudflare.id
}

# Workspace
resource "tfe_workspace" "tf_cloudflare" {
  description         = "Manage my Cloudflare infrastructure with Terraform"
  global_remote_state = true
  name                = "tf-cloudflare"
  terraform_version   = "~> 1.9.0"

  vcs_repo {
    identifier     = "BlueRaven1975/tf-cloudflare"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

}
