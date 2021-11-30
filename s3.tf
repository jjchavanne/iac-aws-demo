resource "aws_s3_bucket" "bucket" {
  bucket = "my-iac-aws-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "a861495e4048f9669527e99fa796aa3ac2c7b211"
    git_file             = "s3.tf"
    git_last_modified_at = "2021-11-30 19:30:38"
    git_last_modified_by = "jchavanne@paloaltonetworks.com"
    git_modifiers        = "31355989+jjchavanne/jchavanne"
    git_org              = "jjchavanne"
    git_repo             = "iac-aws-demo"
    yor_trace            = "ace51502-34ba-454d-9fa3-0062c9dbb0ff"
  }

  versioning {
    enabled    = false
    mfa_delete = false
  }

  logging {
    target_bucket = "my-iac-demo-tf-logs-bucket"
    target_prefix = "log/my-iac-aws-demo-tf-test-bucket"
  }
  hosted_zone_id = "Z3BJ6K6RIION7M"
  request_payer  = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


