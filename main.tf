resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.domain
}
