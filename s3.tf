resource "aws_s3_bucket" "b" {
  bucket = "my-iac-demo-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
