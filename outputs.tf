output "id" {
  description = "Cloudflare Zone ID"
  value       = cloudflare_zone.this.id
}

output "name_servers" {
  description = "Cloudflare Zone Name Servers"
  value       = cloudflare_zone.this.name_servers
}

output "status" {
  description = "Cloudflare Zone Status"
  value       = cloudflare_zone.this.status
}

output "settings" {
  description = "Cloudflare Zone Settings"
  value       = cloudflare_zone_settings_override.this
}
