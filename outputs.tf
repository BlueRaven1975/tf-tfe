output "tfe_organization_token" {
  sensitive = true
  value     = tfe_organization_token.this.token
}
