 terraform {
  # backend "remote"{
  #   hostname = "app.terraform.io"
  #   organization = "GhettoTechGuy"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }

#  cloud {
#     organization = "GhettoTechGuy"
#     workspaces {
#       name = "terra-house-1"
#     }
#   }
}

module "terrahous_aws"{
  source = "./modules/terrahouse_aws"
  user_uuid= var.user_uuid 
  bucket_name = var.bucket_name

}


