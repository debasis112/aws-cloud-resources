# ECR Public repository creation
resource "aws_ecrpublic_repository" "public-repo-01" {
  provider = aws.us_east_1
  repository_name = "project-work"

  catalog_data {
    about_text        = "Public repository in ECR."
    architectures     = ["ARM"]
    description       = "This repository isa public repository in ECR for storing image for my project."
    operating_systems = ["Linux"]
  }

  tags = merge(var.tags, { Name = "${var.base_name}-ecr-01" })
}
