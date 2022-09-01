provider "aws" {
  region  = "us-east-1"
  #profile = "tatasky-ott"
}

# terraform {
#   backend "s3" {
#     bucket         = "tatasky-terrafom-tfstate-backup"
#     dynamodb_table = "tatasky-terrafom-tfstate-lock"
#     encrypt        = true
#     key            = "wafv2-setup/uat-wafv2/main.tfstate"
#     region         = "ap-south-1"
#     #profile        = "tatasky-ott"
#   }
# }
