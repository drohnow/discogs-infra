
terraform {
    /*
    backend "s3" {
        bucket ="project-purple-dagr-inc"
        key = "terraform.tfstate"
        region = "us-east-2"
        dynamodb_table = "project-purple-tf-lock.tf"
    }
    */
}



provider "aws" {
    region = var.aws_region
}

