
resource "aws_s3_bucket" "bucket" {
      bucket = "damian-test-bucket-curso-terraform2-${var.environment}"

}