resource "aws_lambda_function" "lambda_demo" {
  function_name     = "${local.lambda_classification}"
  handler           = "${var.lambda_handler}"
  runtime           = "${var.lambda_runtime}"
  timeout           = "${var.lambda_timeout}"
  description       = "${var.lambda_description}"
  filename          = "${path.module}/${var.lambda_filename}"
  source_code_hash = "${filebase64sha256("${path.module}/${var.lambda_filename}")}"
  role              = "${aws_iam_role.lambda_role.arn}"
}