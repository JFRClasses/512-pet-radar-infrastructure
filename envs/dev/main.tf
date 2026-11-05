# Terragrunt
module "pet-radar" {
  source = "../../modules/pet-radar"
  environment = "dev"
  mailer_service = ""
  mailer_user = ""
  mapbox_token = ""
  db_password = ""
  key_path = "${path.module}/keys/512-pet-radar-server.pub"
  jwt_secret = ""
  aws_region = "us-east-1"
}