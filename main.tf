resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.domain
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = cloudflare_zone.this.id
  settings {
    always_online               = var.settings_override.always_online
    always_use_https            = var.settings_override.always_use_https
    automatic_https_rewrites    = var.settings_override.automatic_https_rewrites
    binary_ast                  = var.settings_override.binary_ast
    brotli                      = var.settings_override.brotli
    browser_cache_ttl           = var.settings_override.browser_cache_ttl
    browser_check               = var.settings_override.browser_check
    cache_level                 = var.settings_override.cache_level
    challenge_ttl               = var.settings_override.challenge_ttl
    ciphers                     = var.settings_override.ciphers
    cname_flattening            = var.settings_override.cname_flattening
    development_mode            = var.settings_override.development_mode
    early_hints                 = var.settings_override.early_hints
    email_obfuscation           = var.settings_override.email_obfuscation
    filter_logs_to_cloudflare   = var.settings_override.filter_logs_to_cloudflare
    fonts                       = var.settings_override.fonts
    h2_prioritization           = var.settings_override.h2_prioritization
    hotlink_protection          = var.settings_override.hotlink_protection
    http2                       = var.settings_override.http2
    http3                       = var.settings_override.http3
    image_resizing              = var.settings_override.image_resizing
    ip_geolocation              = var.settings_override.ip_geolocation
    ipv6                        = var.settings_override.ipv6
    log_to_cloudflare           = var.settings_override.log_to_cloudflare
    max_upload                  = var.settings_override.max_upload
    min_tls_version             = var.settings_override.min_tls_version
    mirage                      = var.settings_override.mirage
    opportunistic_encryption    = var.settings_override.opportunistic_encryption
    opportunistic_onion         = var.settings_override.opportunistic_onion
    orange_to_orange            = var.settings_override.orange_to_orange
    origin_error_page_pass_thru = var.settings_override.origin_error_page_pass_thru
    origin_max_http_version     = var.settings_override.origin_max_http_version
    polish                      = var.settings_override.polish
    prefetch_preload            = var.settings_override.prefetch_preload
    privacy_pass                = var.settings_override.privacy_pass
    proxy_read_timeout          = var.settings_override.proxy_read_timeout
    pseudo_ipv4                 = var.settings_override.pseudo_ipv4
    response_buffering          = var.settings_override.response_buffering
    rocket_loader               = var.settings_override.rocket_loader
    security_level              = var.settings_override.security_level
    server_side_exclude         = var.settings_override.server_side_exclude
    sort_query_string_for_cache = var.settings_override.sort_query_string_for_cache
    ssl                         = var.settings_override.ssl
    tls_1_3                     = var.settings_override.tls_1_3
    tls_client_auth             = var.settings_override.tls_client_auth
    true_client_ip_header       = var.settings_override.true_client_ip_header
    universal_ssl               = var.settings_override.universal_ssl
    visitor_ip                  = var.settings_override.visitor_ip
    waf                         = var.settings_override.waf
    webp                        = var.settings_override.webp
    websockets                  = var.settings_override.websockets
    zero_rtt                    = var.settings_override.zero_rtt

    dynamic "minify" {
      for_each = var.settings_override.minify[*]
      content {
        css  = minify.value.css
        html = minify.value.html
        js   = minify.value.js
      }
    }

    dynamic "mobile_redirect" {
      for_each = var.settings_override.mobile_redirect[*]
      content {
        mobile_subdomain = mobile_redirect.value.mobile_subdomain
        status           = mobile_redirect.value.status
        strip_uri        = mobile_redirect.value.strip_uri
      }
    }

    dynamic "security_header" {
      for_each = var.settings_override.security_header[*]
      content {
        enabled            = security_header.value.enabled
        include_subdomains = security_header.value.include_subdomains
        max_age            = security_header.value.max_age
        nosniff            = security_header.value.nosniff
        preload            = security_header.value.preload
      }
    }
  }
}

resource "cloudflare_ruleset" "http_config_settings" {
  count = length(var.http_config_settings) > 0 ? 1 : 0

  zone_id = cloudflare_zone.this.id
  kind    = "zone"
  name    = "Default ruleset for http_config_settings phase"
  phase   = "http_config_settings"

  dynamic "rules" {
    for_each = var.http_config_settings

    content {
      action      = "set_config"
      description = rules.value.description
      enabled     = rules.value.enabled
      expression  = rules.value.expression

      action_parameters {
        polish = rules.value.action_parameters.polish
      }
    }
  }
}
