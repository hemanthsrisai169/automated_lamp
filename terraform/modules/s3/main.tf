
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name 

  tags = {
    Name        = var.bucket_tag
    Environment = var.env
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
    bucket = aws_s3_bucket.s3_bucket.id
    acl = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.s3_bucket.id

    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::${var.bucket_name}/*"
            }
        ]
    })
}