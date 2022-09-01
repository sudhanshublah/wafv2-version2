# terraform {
#   required_providers {
#     archive = {
#       source = "hashicorp/archive"
#     }
#     aws = {
#       source = "hashicorp/aws"
#     }
#     template = {
#       source = "hashicorp/template"
#     }
#   }
#   required_version = ">=1.2.5"
# }

terraform {
  required_version = ">=1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
