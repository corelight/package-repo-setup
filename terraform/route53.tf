resource "aws_route53_zone" "packaging_corelight_io" {
  name = "packaging.corelight.io"
}

resource "aws_route53_record" "packaging_corelight_io_s3Buckety" {
  name = "scripts"
  type = "CNAME"
  zone_id = aws_route53_zone.packaging_corelight_io.zone_id
  records = [
    aws_s3_bucket.packaging_scripts.website_endpoint
  ]

  ttl = 30
}

