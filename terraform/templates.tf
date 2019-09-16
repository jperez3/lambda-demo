data "template_file" "lambda_assume_role" {
  template = "${file("${path.module}/templates/lambda_assume_role.json.tpl")}"
}