
terraform {
  backend "s3" {
    # Configuration will be provided via CLI arguments
    # in the GitHub Actions workflows
  }
}