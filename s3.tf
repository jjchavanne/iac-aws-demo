resource "aws_s3_bucket" "bucket" {
  bucket = "my-iac-aws-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "5cbb70c0f7b57e986dbce262464198a7002ecb74"
    git_file             = "s3.tf"
    git_last_modified_at = "2021-11-14 04:25:43"
    git_last_modified_by = "jchavanne@paloaltonetworks.com"
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
    enabled    = false
    mfa_delete = false
  }
  logging {
    target_bucket = "my-iac-demo-tf-logs-bucket"
    target_prefix = "log/my-iac-aws-demo-tf-test-bucket"
  }
  hosted_zone_id = "Z3BJ6K6RIION7M"
  request_payer  = "BucketOwner"
}



resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


