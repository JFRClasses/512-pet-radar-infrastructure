provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "keys" {
  key_name = "${var.environment}-key"
  public_key = file(var.key_path)
}