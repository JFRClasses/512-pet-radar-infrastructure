variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "db_password" {
  type = string
}

variable "jwt_secret" {
  type = string
}

variable "mailer_service" {
  type = string
  default = "gmail"
}
# SSH
variable "mailer_user" {
  type = string
}

variable "key_path" {
  type = string
}

variable "mapbox_token" {
  type = string
}