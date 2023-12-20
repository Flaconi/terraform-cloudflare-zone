# terraform-cloudflare-zone

Terraform modules to create Cloudflare Hosted zone

[![lint](https://github.com/flaconi/terraform-cloudflare-zone/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-cloudflare-zone/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-cloudflare-zone/workflows/test/badge.svg)](https://github.com/flaconi/terraform-cloudflare-zone/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-cloudflare-zone.svg)](https://github.com/flaconi/terraform-cloudflare-zone/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.20 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.20 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_api_token"></a> [api\_token](#input\_api\_token)

Description: The Cloudflare API token.

Type: `string`

### <a name="input_domain"></a> [domain](#input\_domain)

Description: Cloudflare domain name to create

Type: `string`

### <a name="input_account_id"></a> [account\_id](#input\_account\_id)

Description: Account ID to manage the zone resource in.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_settings_override"></a> [settings\_override](#input\_settings\_override)

Description: Various values which customizes Cloudflare zone settings. Note that some settings are only available on certain plans.

Type:

```hcl
object({
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
```

Default: `{}`

### <a name="input_http_config_settings"></a> [http\_config\_settings](#input\_http\_config\_settings)

Description: Cloudflare ruleset for phase http\_config\_settings. It override the zone settings per request by defining an expression.

Type:

```hcl
list(object({
    action_parameters = object({
      polish = optional(string)
    })
    description = string
    enabled     = optional(bool, true)
    expression  = string
  }))
```

Default: `[]`

### <a name="input_bot_management"></a> [bot\_management](#input\_bot\_management)

Description: Cloudflare bot management configuration.

Type:

```hcl
object({
    auto_update_model = optional(bool, false)
    enable_js         = optional(bool, false)
  })
```

Default: `{}`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Cloudflare Zone ID |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | Cloudflare Zone Name Servers |
| <a name="output_plan"></a> [plan](#output\_plan) | Cloudflare Zone commercial plan |
| <a name="output_settings"></a> [settings](#output\_settings) | Cloudflare Zone Settings |
| <a name="output_status"></a> [status](#output\_status) | Cloudflare Zone Status |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
