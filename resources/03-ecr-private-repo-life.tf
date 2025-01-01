# # ECR Private repository image life cycle policy
# resource "aws_ecr_lifecycle_policy" "example" {
#   provider   = aws.us_east_1 # Reference the aliased provider
#   repository = aws_ecr_repository.private-repo-01.name

#   policy = <<EOF
# {
#     "rules": [
#         {
#             "rulePriority": 1,
#             "description": "Expire images older than 14 days",
#             "selection": {
#                 "tagStatus": "untagged",
#                 "countType": "sinceImagePushed",
#                 "countUnit": "days",
#                 "countNumber": 14
#             },
#             "action": {
#                 "type": "expire"
#             }
#         }
#     ]
# }
# EOF
# }
