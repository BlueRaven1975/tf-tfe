# Organization
resource "tfe_organization" "this" {
  email = "romano.romano@gmail.com"
  name  = "BlueRaven1975"
}

# Workspaces
resource "tfe_workspace" "tf_github" {
  description = "Manage my GitHub repositories via Terraform"
  name        = "tf-github"
}

resource "tfe_workspace" "tf_minikube" {
  description = "Setup and configure Minikube on my local laptop with Terraform"
  name        = "tf-minikube"
}

resource "tfe_workspace" "tf_tfe" {
  description = "Manage my Terraform Cloud instance with Terraform"
  name        = "tf-tfe"
}
