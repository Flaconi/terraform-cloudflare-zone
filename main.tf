resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.domain
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = cloudflare_zone.this.id
  settings {
    brotli         = var.settings_override.brotli
    early_hints    = var.settings_override.early_hints
    http2          = var.settings_override.http2
    image_resizing = var.settings_override.image_resizing
  }
}
