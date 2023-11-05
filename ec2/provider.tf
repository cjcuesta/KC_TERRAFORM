terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" #el proveedor AWS
      version = "~> 5.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "tls" {
  alias = "private_key"

}

provider "aws" {
  region = "eu-west-1" #la region de Irlanda

}

