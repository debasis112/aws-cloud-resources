# Attach the AWS managed policy for App Runner ECR access
resource "aws_iam_role_policy_attachment" "apprunner_ecr_access_attach" {
  role       = aws_iam_role.apprunner_ecr_access.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}
