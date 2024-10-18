# ECR Public repository creation
resource "aws_ecrpublic_repository" "public-repo-01" {
  provider        = aws.us_east_1
  repository_name = "public-project-work"

  catalog_data {
    about_text        = "Public repository in ECR."
    architectures     = ["ARM"]
    description       = "This repository isa public repository in ECR for storing image for my project."
    operating_systems = ["Linux"]
  }

  tags = merge(var.tags, { Name = "${var.base_name}-ecr-public-01" })
}

# ECR Private repository creation.
resource "aws_ecr_repository" "private-repo-01" {
  provider             = aws.us_east_1
  name                 = "private-project-work"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge(var.tags, { Name = "${var.base_name}-ecr-private-01" })
}

# ECR Private repository creation.
resource "aws_ecr_repository" "private-repo-02" {
  # provider             = aws.us_east_1
  name                 = "private-project-work"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge(var.tags, { Name = "${var.base_name}-ecr-private-02" })
}
