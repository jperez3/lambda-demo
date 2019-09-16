resource "aws_iam_role" "lambda_role" {
  name                = "${local.lambda_classification}"
  description         = "IAM role for certificate management lambda"
  path                = "/lambda_roles/${var.service}/"
  assume_role_policy  = "${data.template_file.lambda_assume_role.rendered}"

  tags {
    Environment = "${var.env}"
    Service     = "${var.service}"
    Lambda      = "${local.lambda_classification}"
  }
}