terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file("terraform_credentails.json")
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_dns_managed_zone" "my_zone" {
  name          = "my-domain-zone"
  dns_name      = "cloudroot7.xyz."
  description   = "cloudroot7 Public DNS zone"
  force_destroy = "true"
}

output "name_servers" {
  value = google_dns_managed_zone.my_zone.name_servers
}