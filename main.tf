resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.domain
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = cloudflare_zone.this.id
  settings {
    brotli         = var.settings_override.brotli
    early_hints    = var.settings_override.early_hints
    # Some settings are not available for "free" commercial plan
    http2          = cloudflare_zone.this.plan != "free" ? var.settings_override.http2 : null
    image_resizing = cloudflare_zone.this.plan != "free" ? var.settings_override.image_resizing : null
  }
}
