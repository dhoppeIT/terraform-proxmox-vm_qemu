# Example

The configuration in this directory creates:

* proxmox_vm_qemu

## Usage

To run this example, you need to execute the following commands:

```shell
terraform init
terraform plan
terraform apply
```

:warning: This example may create resources that cost money. Execute the
command `terraform destroy` when the resources are no longer needed.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.1-rc8 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_proxmox_vm_qemu"></a> [proxmox\_vm\_qemu](#module\_proxmox\_vm\_qemu) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pm_api_token_id"></a> [pm\_api\_token\_id](#input\_pm\_api\_token\_id) | This is an API token you have previously created for a specific user | `string` | `null` | no |
| <a name="input_pm_api_token_secret"></a> [pm\_api\_token\_secret](#input\_pm\_api\_token\_secret) | This uuid is only available when the token was initially created | `string` | `null` | no |
| <a name="input_pm_api_url"></a> [pm\_api\_url](#input\_pm\_api\_url) | This is the target Proxmox API endpoint | `string` | n/a | yes |
| <a name="input_pm_debug"></a> [pm\_debug](#input\_pm\_debug) | Enable verbose output in proxmox-api-go | `bool` | `false` | no |
| <a name="input_pm_log_enable"></a> [pm\_log\_enable](#input\_pm\_log\_enable) | Enable debug logging, see the section below for logging details | `bool` | `false` | no |
| <a name="input_pm_log_file"></a> [pm\_log\_file](#input\_pm\_log\_file) | The log file the provider will write logs to | `string` | `"terraform-plugin-proxmox.log"` | no |
| <a name="input_pm_log_levels"></a> [pm\_log\_levels](#input\_pm\_log\_levels) | A map of log sources and levels | `map(string)` | `{}` | no |
| <a name="input_pm_otp"></a> [pm\_otp](#input\_pm\_otp) | The 2FA OTP code | `string` | `null` | no |
| <a name="input_pm_parallel"></a> [pm\_parallel](#input\_pm\_parallel) | Allowed simultaneous Proxmox processes | `number` | `1` | no |
| <a name="input_pm_password"></a> [pm\_password](#input\_pm\_password) | The password | `string` | `null` | no |
| <a name="input_pm_proxy_server"></a> [pm\_proxy\_server](#input\_pm\_proxy\_server) | Send provider api call to a proxy server for easy debugging | `string` | `null` | no |
| <a name="input_pm_timeout"></a> [pm\_timeout](#input\_pm\_timeout) | Timeout value (seconds) for proxmox API calls | `number` | `300` | no |
| <a name="input_pm_tls_insecure"></a> [pm\_tls\_insecure](#input\_pm\_tls\_insecure) | Disable TLS verification while connecting to the proxmox server | `bool` | `false` | no |
| <a name="input_pm_user"></a> [pm\_user](#input\_pm\_user) | The user, remember to include the authentication realm such as myuser@pam or myuser@pve | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_ipv4_address"></a> [default\_ipv4\_address](#output\_default\_ipv4\_address) | The default IPv4 address |
| <a name="output_default_ipv6_address"></a> [default\_ipv6\_address](#output\_default\_ipv6\_address) | The default IPv6 address |
| <a name="output_ssh_host"></a> [ssh\_host](#output\_ssh\_host) | The hostname or IP to use to connect to the VM for preprovisioning |
| <a name="output_ssh_port"></a> [ssh\_port](#output\_ssh\_port) | The port to connect to the VM over SSH for preprovisioning |
<!-- END_TF_DOCS -->
