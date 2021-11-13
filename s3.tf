resource "aws_s3_bucket" "b" {
  bucket = "my-iac-demo-tf-test-bucket"
  acl    = "private"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "f5eec8467ddf7ff22f121fe155e27f399c3a445a"
    git_file             = "s3.tf"
    git_last_modified_at = "2021-11-13 15:30:06"
    git_last_modified_by = "31355989+jjchavanne@users.noreply.github.com"
    git_modifiers        = "31355989+jjchavanne"
    git_org              = "jjchavanne"
    git_repo             = "iac-aws-demo"
    yor_trace            = "ace51502-34ba-454d-9fa3-0062c9dbb0ff"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
}
