terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" #el proveedor AWS
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1" #la region de Irlanda

}