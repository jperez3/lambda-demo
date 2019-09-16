provider "aws" {
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
    version = "2.19"
}


terraform {
  required_version = ">= 0.11.11, < 0.12.0"

  backend "local" {
    path = "terraform.tfstate"
  }
}