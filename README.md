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
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.2 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.2 |

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

## Optional Inputs

No optional inputs.

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Cloudflare Zone ID |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | Cloudflare Zone Name Servers |
| <a name="output_status"></a> [status](#output\_status) | Cloudflare Zone Status |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
