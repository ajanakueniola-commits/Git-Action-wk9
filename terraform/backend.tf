terraform {
  backend "s3" {
    bucket         = "funmi-cicd-state-bucket"
    key            = "env/dev-wk9/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }   
}
