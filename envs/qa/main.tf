module "fundamentals" {
  source = "../../modules/fundamentals"
  AWS_ECR_NAME = "qa-512-ecr-petradar"
  AWS_BUCKET_NAME = "qa-512-bucket"
  AWS_REGION = "us-east-1"
}