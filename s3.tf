resource "aws_s3_bucket" "b" {
  bucket = "my-iac-demo-tf-test-bucket"
  acl    = "public-read"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "fc343ce461edcb0f0590932ac99dd703e9302270"
    git_file             = "s3.tf"
    git_last_modified_at = "2021-11-13 20:25:22"
    git_last_modified_by = "31355989+jjchavanne@users.noreply.github.com"
    git_modifiers        = "31355989+jjchavanne/jchavanne"
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
  logging {
    target_bucket = "my-iac-demo-tf-logs-bucket"
    target_prefix = "log/my-iac-demo-tf-test-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


