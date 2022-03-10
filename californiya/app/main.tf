variable "domain_name" {
  description = "The name of the domain for our website."
  default = "explorecaliforniya.org"
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject" ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::explorecalifornia.org/*" ]
  }
}

/* We can access properties from data sources using this format:
   ${data.<data_source_type>.<data_source_name>.<property>.

   In this case, we need the JSON document, which the documentation
   says can be accessed from the .json property. */

resource "aws_s3_bucket" "website" {
  bucket = var.domain_name          // The name of the bucket.
  /* acl    = "public-read"             Access control list for the bucket.
                                       Websites need to be publicly-available
                                       to the Internet for website hosting to
                                       work. */  
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html" // The root of the website.
  }

  error_document {
    key = "error.html" // The page to show when people hit invalid pages.
  }
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = "${data.aws_iam_policy_document.bucket_policy.json}"
}


output "website_bucket_url" {
  value = "${aws_s3_bucket.website.website_endpoint}"
}
