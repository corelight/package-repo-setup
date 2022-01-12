locals {
  # known TerraformUser roles per workspace (NOTE: still region-specifc)
  workspace_iam_role_numbers = {
    default = "620265139132" # arn:aws:iam::277360468408:role/TerraformUser
    #    testing     = ""
    #    release     = ""
  }
  serverless_stages          = {
    default     = "default"
    development = "dev" # used to align w/ serverless names
    testing     = "testing"
    release     = "release"
  }
  admin_account_number       = "657159205431"
  account_number             = local.workspace_iam_role_numbers[terraform.workspace]
  serverless_stage           = local.serverless_stages[terraform.workspace]
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_role" "terraform_user" {
  name = "TerraformUser"
}

provider "aws" {
  region  = "us-east-1"
  profile = "administration"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_number}:role/TerraformUser"
    # can't use the aws data element because provider must be configured first
  }
}

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70.0"
    }

    template = {
      source = "hashicorp/template"
    }
  }

  required_version = "= 1.1.2"
  backend "s3" {
    bucket  = "corelight-tf"
    key     = "v1/packaging-tf"
    region  = "us-east-1"
    encrypt = "true"
    profile = "administration"
  }
}
