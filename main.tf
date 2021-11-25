resource "cloudflare_zone" "this" {
  zone = var.domain
}
