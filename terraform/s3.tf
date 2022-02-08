resource "aws_s3_bucket" "b" {
  bucket = "s3-website-tinoco.hashicorp.com"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b
  key    = "index.html"
  source = "../index.html"
}