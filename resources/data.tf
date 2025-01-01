# # Data source to get the AWS Account ID
# data "aws_caller_identity" "current" {}

# # ECR Repository (Private/Public) IAM Policy
# data "aws_iam_policy_document" "iam-policy-01" {
#   provider = aws.us_east_1 # Reference the aliased provider
#   statement {
#     sid    = "new policy"
#     effect = "Allow"

#     principals {
#       type        = "AWS"
#       identifiers = ["022499026373"]
#     }

#     actions = [
#       "ecr:GetDownloadUrlForLayer",
#       "ecr:BatchGetImage",
#       "ecr:BatchCheckLayerAvailability",
#       "ecr:PutImage",
#       "ecr:InitiateLayerUpload",
#       "ecr:UploadLayerPart",
#       "ecr:CompleteLayerUpload",
#       "ecr:DescribeRepositories",
#       "ecr:GetRepositoryPolicy",
#       "ecr:ListImages",
#       "ecr:DeleteRepository",
#       "ecr:BatchDeleteImage",
#       "ecr:SetRepositoryPolicy",
#       "ecr:DeleteRepositoryPolicy",
#     ]
#   }
# }
