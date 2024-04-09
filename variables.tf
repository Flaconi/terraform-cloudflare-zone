variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}

variable "account_name" {
  description = "Account Name to manage the zone resource in. `Account Settings:Read` permission is required."
  type        = string
}

variable "domain" {
  description = "Cloudflare domain name to create"
  type        = string
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override
variable "settings_override" {
  description = "Various values which customizes Cloudflare zone settings. Note that some settings are only available on certain plans."
  type = object({
    always_online             = optional(string)
    always_use_https          = optional(string)
    automatic_https_rewrites  = optional(string)
    binary_ast                = optional(string)
    brotli                    = optional(string)
    browser_cache_ttl         = optional(number)
    browser_check             = optional(string)
    cache_level               = optional(string)
    challenge_ttl             = optional(number)
    ciphers                   = optional(list(string))
    cname_flattening          = optional(string)
    development_mode          = optional(string)
    early_hints               = optional(string)
    email_obfuscation         = optional(string)
    filter_logs_to_cloudflare = optional(string)
    fonts                     = optional(string)
    h2_prioritization         = optional(string)
    hotlink_protection        = optional(string)
    http2                     = optional(string)
    http3                     = optional(string)
    image_resizing            = optional(string)
    ip_geolocation            = optional(string)
    ipv6                      = optional(string)
    log_to_cloudflare         = optional(string)
    max_upload                = optional(number)
    min_tls_version           = optional(string)
    minify = optional(object({
      css  = optional(string, "off")
      html = optional(string, "off")
      js   = optional(string, "off")
    }))
    mirage = optional(string)
    mobile_redirect = optional(object({
      mobile_subdomain = optional(string, "")
      status           = optional(string, "off")
      strip_uri        = optional(string, false)
    }))
    opportunistic_encryption    = optional(string)
    opportunistic_onion         = optional(string)
    orange_to_orange            = optional(string)
    origin_error_page_pass_thru = optional(string)
    origin_max_http_version     = optional(string)
    polish                      = optional(string)
    prefetch_preload            = optional(string)
    privacy_pass                = optional(string)
    proxy_read_timeout          = optional(string)
    pseudo_ipv4                 = optional(string)
    response_buffering          = optional(string)
    rocket_loader               = optional(string)
    security_header = optional(object({
      enabled            = optional(bool)
      include_subdomains = optional(bool)
      max_age            = optional(number)
      nosniff            = optional(bool)
      preload            = optional(bool)
    }))
    security_level              = optional(string)
    server_side_exclude         = optional(string)
    sort_query_string_for_cache = optional(string)
    ssl                         = optional(string)
    tls_1_3                     = optional(string)
    tls_client_auth             = optional(string)
    true_client_ip_header       = optional(string)
    universal_ssl               = optional(string)
    visitor_ip                  = optional(string)
    waf                         = optional(string)
    webp                        = optional(string)
    websockets                  = optional(string)
    zero_rtt                    = optional(string)
  })
  default = {}
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/bot_management
variable "bot_management" {
  description = "Cloudflare bot management configuration."
  type = object({
    auto_update_model = optional(bool, false)
    enable_js         = optional(bool, false)
  })
  default = {}
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset
variable "http_config_settings" {
  description = "Cloudflare ruleset for phase http_config_settings. It override the zone settings per request by defining an expression."
  type = list(object({
    action_parameters = object({
      polish = optional(string)
    })
    description = string
    enabled     = optional(bool, true)
    expression  = string
  }))
  default = []
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset
variable "http_log_custom_fields" {
  description = "Cloudflare ruleset for phase http_log_custom_fields."
  type = list(object({
    action_parameters = object({
      request_fields  = optional(list(string))
      response_fields = optional(list(string))
      cookie_fields   = optional(list(string))
    })
    description = string
    enabled     = optional(bool, true)
    expression  = string
  }))
  default = []
}
