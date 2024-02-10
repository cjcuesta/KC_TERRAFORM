terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.15.0"
    }
  }
}

provider "google" {
  # Archivo de credenciales
  credentials = file("cred.json")
  #ID del proyecto en GC
  project = "practica-keep-carlosjulio"
  region = "europe-west3"
  zone = "europe-west3-A"

}