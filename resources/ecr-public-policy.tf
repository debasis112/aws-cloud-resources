# ECR Public repo policy
resource "aws_ecrpublic_repository_policy" "public-repo-policy" {
  repository_name = aws_ecrpublic_repository.public-repo-01.repository_name
  policy          = data.aws_iam_policy_document.iam-policy-01.json
}