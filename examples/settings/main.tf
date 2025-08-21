variable "token" {
  description = "Cloudflare API token"
  type        = string
}

provider "cloudflare" {
  api_token = var.token
}

module "example" {
  source = "../../"

  account_name = "Your Account"
  domain       = "example.com"

  settings = {
    origin_max_http_version = "2"
    security_level          = "medium"
    ssl                     = "strict"
    webp                    = "on"
  }

  bot_management = {
    enable_js = true
  }
}

output "zone_id" {
  value = module.example.id
}
