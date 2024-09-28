variable "github_token" {
  description = "GitHub API token"
  sensitive   = true
  type        = string
}

variable "tfe_token" {
  description = "Terraform Cloud API token"
  sensitive   = true
  type        = string
}
