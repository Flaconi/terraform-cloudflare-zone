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
}

output "zone_id" {
  value = module.example.id
}
