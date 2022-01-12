resource "aws_s3_bucket" "packaging_scripts" {
  bucket = "packaging-scripts"
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "packaging_website_bucket_attachement" {
  bucket = aws_s3_bucket.packaging_scripts.id
  policy = data.aws_iam_policy_document.website_bucket_policy_document.json
}

data "aws_iam_policy_document" "website_bucket_policy_document" {
  statement {
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.packaging_scripts.arn}/*"
    ]
  }
}