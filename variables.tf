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

variable "settings_override" {
  description = "Various values which customizes Cloudflare zone settings"
  type = object({
    brotli         = optional(string)
    early_hints    = optional(string)
    http2          = optional(string)
    image_resizing = optional(string)
  })
  default = {}
}
