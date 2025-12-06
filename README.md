# Proxmox IAC
This is my Proxmox IAC for my homelab. Using opentofu together with the Telmate/proxmox provider.

![Provider](https://img.shields.io/badge/provider-telmate-proxmox)
![OpenTofu Version](https://img.shields.io/badge/opentofu-%3E%3D1.0-blueviolet)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.2-rc06 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 3.0.2-rc06 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.Unraid](https://registry.terraform.io/providers/Telmate/proxmox/3.0.2-rc06/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | The API URL of the Proxmox VE instance | `string` | n/a | yes |
| <a name="input_pm_api_token_id"></a> [pm\_api\_token\_id](#input\_pm\_api\_token\_id) | The API token id of the Proxmox VE instance | `string` | n/a | yes |
| <a name="input_pm_api_token_secret"></a> [pm\_api\_token\_secret](#input\_pm\_api\_token\_secret) | The API token secret of the Proxmox VE instance | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->