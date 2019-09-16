locals {
    lambda_classification = "${lower(var.lambda_name)}_${lower(var.service)}_${lower(var.env)}_${lower(replace(var.aws_region, "-",""))}_${lower(replace(var.domain_name,".","_"))}" 
}


variable "lambda_name" {
    description = "name of lambda function"
    default     = "demo"
}



variable "lambda_handler" {
    description = "Lambda handler"
    default     = "app.lambda_handler"  
}

variable "lambda_runtime" {
    description = "Lambda runtime"
    default     = "python3.7"
}

variable "lambda_timeout" {
    description = "Lambda timeout"
    default     = "300"
}

variable "lambda_description" {
    description = "description of lambda's purpose"
    default     = "lambda demoooooooo"
}


variable "lambda_filename" {
    description = "lambda zip filename"
    default     = "../lambda/lambda.zip"
}

variable "lambda_tag_managed_by" {
    description = "tag to differentiate terraform managed lambda functions from non-terraform managed lambda functions"
    default     = "terraform"
}

variable "domain_name" {
    description = "default domain name for dns resolution"
    default     = "example.com"
}
