resource "google_dns_managed_zone" "my_zone" {
  name          = "my-cloudrroot7-domain-zone"
  dns_name      = "cloudroot7.xyz."
  description   = "cloudroot7 Public DNS zone"
  force_destroy = "true"
}

output "name_servers" {
  value = google_dns_managed_zone.my_zone.name_servers
}