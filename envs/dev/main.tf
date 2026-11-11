# Terragrunt
module "pet-radar" {
  source = "../../modules/pet-radar"
  environment = "dev"
  mailer_service = var.MAILER_SERVICE
  mailer_user = var.MAILER_USER
  mapbox_token = var.MAPBOX_TOKEN
  db_password = var.DB_PASSWORD
  key_path = "${path.module}/keys/512-pet-radar-server.pub"
  aws_region = "us-east-1"
  mailer_password = var.MAILER_PASSWORD
  redis_port = var.REDIS_PORT
  redis_host = var.REDIS_HOST
  db_user = var.DB_USER
  db_host = var.DB_HOST
  db_type = var.DB_TYPE
  db_port = var.DB_PORT
  db_name = var.DB_NAME
}