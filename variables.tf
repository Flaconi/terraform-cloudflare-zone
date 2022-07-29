variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}

variable "domain" {
  description = "Cloudflare domain name to create"
  type        = string
}

variable "account_id" {
  description = "Account ID to manage the zone resource in."
  type        = string
}
