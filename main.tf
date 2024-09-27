
resource "aws_kms_key" "kms_encryption_key" {
      description             = "KMS key 1 Damian-Enrique"
      deletion_window_in_days = 7
}

resource "aws_s3_bucket" "practica_1_bucket_damian_enrique" {
      bucket = "damian-test-bucket-curso-terraform2-${var.environment}"
}

resource "aws_s3_bucket_acl" "practica1_bucket_acl_damian_enrique" {
      bucket = aws_s3_bucket.practica_1_bucket_damian_enrique.id
      acl    = "private"
}

resource "aws_s3_object" "example" {

      for_each = var.file_map

      key        = "/damian/enrique/${each.key}"
      content    = "${each.value}"
      bucket     = aws_s3_bucket.practica_1_bucket_damian_enrique.id
      kms_key_id = aws_kms_key.kms_encryption_key.arn
}