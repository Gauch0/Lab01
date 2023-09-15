
provider "aws" {
  region = var.aws_region
  profile = "default"
}

/*

Note-1: AWS Credentials Profile (profile = "default") is configured on your local desktop terminal
$HOME/.aws/credentials

*/