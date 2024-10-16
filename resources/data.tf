# Data source to get the AWS Account ID
data "aws_caller_identity" "current" {}

# Data source to get the latest image from the ECR Public repository
# data "aws_ecr_image" "ecr_image" {
#   repository_name = "public-project-work"
#   image_tag       = "v1.0.0"
# }

# # For specific subnet of name tag
# data "aws_subnet" "subnet-01" {
#   filter {
#     name   = "tag:Name"
#     values = ["deb-subnet-01"]
#   }
# }

# data "aws_secretsmanager_secret_version" "secret-id" {
#   secret_id = aws_secretsmanager_secret.acr_spn_credentials.id
# }

# ECR IAM Policy
data "aws_iam_policy_document" "iam-policy-01" {
  provider = aws.us_east_1 # Reference the aliased provider
  statement {
    sid    = "new policy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["022499026373"]
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]
  }
}
