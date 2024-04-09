output "account_id" {
  description = "Cloudflare Account ID"
  value       = data.cloudflare_accounts.this.accounts[0].id
}

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

output "plan" {
  description = "Cloudflare Zone commercial plan"
  value       = cloudflare_zone.this.plan
}

output "settings" {
  description = "Cloudflare Zone Settings"
  value       = cloudflare_zone_settings_override.this
}
