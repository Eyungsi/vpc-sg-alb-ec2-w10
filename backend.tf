terraform {
  backend "s3" {
    bucket       = "week10-statefile"
    key          = "alb/terraform.state"
    region       = "us-east-1"
    encrypt      = true
   }
}