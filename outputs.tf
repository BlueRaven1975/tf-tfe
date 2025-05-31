output "tfe_oauth_client_id" {
  description = "The ID of the OAuth client created in Terraform Cloud"
  value       = tfe_oauth_client.this.id
}

output "tfe_oauth_client_oauth_token_id" {
  description = "The OAuth token for the OAuth client in Terraform Cloud"
  value       = tfe_oauth_client.this.oauth_token_id
}
