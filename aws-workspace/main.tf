resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "tfc-demo-bucket-"
}

resource "aws_sns_topic" "topic" {
  name = "tfc-demo-topic"
}