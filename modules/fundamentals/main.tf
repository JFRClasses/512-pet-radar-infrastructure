# OIDC Token

provider "aws" {
  region = var.AWS_REGION
}

resource "aws_s3_bucket" "fundamentals_bucket_s3" {
  bucket = var.AWS_BUCKET_NAME
  force_destroy = true
}

resource "aws_ecr_repository" "test_repository" {
  name = var.AWS_ECR_NAME
  force_delete = true
}