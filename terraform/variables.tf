variable "aws_profile" {
    description = "awscli profile used to provision aws resources"
    default     = "lambda-demo"
}

variable "aws_region" {
    description = "AWS Region"
    default     = "us-east-1"
}

variable "env" {
    description = "which stage does this live in"
    default     = "stg"
}


variable "service" {
    description = "unique service name"
    default     = "testservice"
}
