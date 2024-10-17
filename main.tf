# OAuth Client
resource "tfe_oauth_client" "this" {
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  name             = "GitHub"
  oauth_token      = var.github_token
  service_provider = "github"
}

# Organization
resource "tfe_organization" "this" {
  cost_estimation_enabled = true
  email                   = "romano.romano@gmail.com"
  name                    = "BlueRaven1975"
}
