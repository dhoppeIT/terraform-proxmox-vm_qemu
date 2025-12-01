# terraform-proxmox-vm_qemu

Terraform module to manage the following Proxmox resources:

* proxmox_vm_qemu

## Usage

Copy and paste the following code snippet to your Terraform configuration,
specify the required variables and run the command `terraform init`.

```hcl
module "proxmox_vm_qemu" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-proxmox-vm-qemu/local"
  version = "1.0.1"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
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
| [proxmox_vm_qemu.this](https://registry.terraform.io/providers/telmate/proxmox/3.0.2-rc06/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent"></a> [agent](#input\_agent) | Set to 1 to enable the QEMU Guest Agent | `number` | `0` | no |
| <a name="input_agent_timeout"></a> [agent\_timeout](#input\_agent\_timeout) | Timeout in seconds to keep trying to obtain an IP address from the guest agent one we have a connection | `number` | `90` | no |
| <a name="input_automatic_reboot"></a> [automatic\_reboot](#input\_automatic\_reboot) | Automatically reboot the VM when parameter changes require this | `bool` | `true` | no |
| <a name="input_automatic_reboot_severity"></a> [automatic\_reboot\_severity](#input\_automatic\_reboot\_severity) | Sets the severity of the error/warning when `automatic_reboot` is `false` | `string` | `"error"` | no |
| <a name="input_balloon"></a> [balloon](#input\_balloon) | The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired | `number` | `0` | no |
| <a name="input_bios"></a> [bios](#input\_bios) | The BIOS to use, options are seabios or ovmf for UEFI | `string` | `"seabios"` | no |
| <a name="input_bootdisk"></a> [bootdisk](#input\_bootdisk) | Enable booting from specified disk | `string` | `null` | no |
| <a name="input_ci_wait"></a> [ci\_wait](#input\_ci\_wait) | How to long in seconds to wait for before provisioning | `number` | `30` | no |
| <a name="input_cicustom"></a> [cicustom](#input\_cicustom) | Instead specifying ciuser, cipasword, etc. you can specify the path to a custom cloud-init config file here | `string` | `null` | no |
| <a name="input_cipassword"></a> [cipassword](#input\_cipassword) | Override the default cloud-init user's password | `string` | `null` | no |
| <a name="input_ciupgrade"></a> [ciupgrade](#input\_ciupgrade) | Whether to upgrade the packages on the guest during provisioning | `bool` | `false` | no |
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Override the default cloud-init user for provisioning | `string` | `null` | no |
| <a name="input_clone"></a> [clone](#input\_clone) | The base VM name from which to clone to create the new VM | `string` | `null` | no |
| <a name="input_clone_id"></a> [clone\_id](#input\_clone\_id) | The base VM id from which to clone to create the new VM | `number` | `null` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The cpu block is used to configure the CPU settings | `map(any)` | `{}` | no |
| <a name="input_define_connection_info"></a> [define\_connection\_info](#input\_define\_connection\_info) | Whether to let terraform define the (SSH) connection parameters for preprovisioners | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the VM | `string` | `null` | no |
| <a name="input_disk"></a> [disk](#input\_disk) | The disk block is used to configure the disk devices | `list(any)` | `[]` | no |
| <a name="input_efidisk"></a> [efidisk](#input\_efidisk) | The efidisk block is used to configure the disk used for EFI data storage | `map(any)` | `{}` | no |
| <a name="input_force_create"></a> [force\_create](#input\_force\_create) | If false, and a VM of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings | `bool` | `false` | no |
| <a name="input_force_recreate_on_change_of"></a> [force\_recreate\_on\_change\_of](#input\_force\_recreate\_on\_change\_of) | If the value of this string changes, the VM will be recreated | `string` | `null` | no |
| <a name="input_full_clone"></a> [full\_clone](#input\_full\_clone) | Set to true to create a full clone, or false to create a linked clone | `bool` | `true` | no |
| <a name="input_hagroup"></a> [hagroup](#input\_hagroup) | The HA group identifier the resource belongs to (requires hastate to be set!) | `string` | `null` | no |
| <a name="input_hastate"></a> [hastate](#input\_hastate) | Requested HA state for the resource | `string` | `null` | no |
| <a name="input_hotplug"></a> [hotplug](#input\_hotplug) | Comma delimited list of hotplug features to enable | `string` | `"network,disk,usb"` | no |
| <a name="input_ipconfig0"></a> [ipconfig0](#input\_ipconfig0) | The first IP address to assign to the gues | `string` | `""` | no |
| <a name="input_ipconfig1"></a> [ipconfig1](#input\_ipconfig1) | The second IP address to assign to the guest | `string` | `""` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory to allocate to the VM in Megabytes | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VM within Proxmox | `string` | n/a | yes |
| <a name="input_nameserver"></a> [nameserver](#input\_nameserver) | Sets default DNS server for guest | `string` | `null` | no |
| <a name="input_network"></a> [network](#input\_network) | The network block is used to configure the network devices | `list(any)` | `[]` | no |
| <a name="input_os_network_config"></a> [os\_network\_config](#input\_os\_network\_config) | Network configuration to be copied into the VM when preprovisioning ubuntu or centos guests | `string` | `null` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Which provisioning method to use, based on the OS type | `string` | `null` | no |
| <a name="input_pci"></a> [pci](#input\_pci) | The pci block is used to configure PCI devices | `list(any)` | `[]` | no |
| <a name="input_pool"></a> [pool](#input\_pool) | The resource pool to which the VM will be added | `string` | `null` | no |
| <a name="input_protection"></a> [protection](#input\_protection) | Enable/disable the VM protection from being removed | `bool` | `false` | no |
| <a name="input_pxe"></a> [pxe](#input\_pxe) | If set to true, enable PXE boot of the VM | `bool` | `null` | no |
| <a name="input_qemu_os"></a> [qemu\_os](#input\_qemu\_os) | The type of OS in the guest | `string` | `"l26"` | no |
| <a name="input_scsihw"></a> [scsihw](#input\_scsihw) | The SCSI controller to emulate | `string` | `"lsi"` | no |
| <a name="input_searchdomain"></a> [searchdomain](#input\_searchdomain) | Sets default DNS search domain suffix | `string` | `null` | no |
| <a name="input_serial"></a> [serial](#input\_serial) | The serial block is used to configure the serial devices | `list(any)` | `[]` | no |
| <a name="input_skip_ipv4"></a> [skip\_ipv4](#input\_skip\_ipv4) | Tells proxmox that acquiring an IPv4 address from the qemu guest agent isn't required, it will still return an ipv4 address if it could obtain one | `bool` | `null` | no |
| <a name="input_skip_ipv6"></a> [skip\_ipv6](#input\_skip\_ipv6) | Tells proxmox that acquiring an IPv6 address from the qemu guest agent isn't required, it will still return an ipv6 address if it could obtain one | `bool` | `null` | no |
| <a name="input_ssh_forward_ip"></a> [ssh\_forward\_ip](#input\_ssh\_forward\_ip) | The IP (and optional colon separated port), to use to connect to the host for preprovisioning | `string` | `null` | no |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The private key to use when connecting to the guest for preprovisioning | `string` | `null` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The user with which to connect to the guest for preprovisioning | `string` | `null` | no |
| <a name="input_sshkeys"></a> [sshkeys](#input\_sshkeys) | Newline delimited list of SSH public keys to add to authorized keys file for the cloud-init user | `string` | `null` | no |
| <a name="input_start_at_node_boot"></a> [start\_at\_node\_boot](#input\_start\_at\_node\_boot) | Whether the guest should start automatically when the Proxmox node boots | `bool` | `false` | no |
| <a name="input_tablet"></a> [tablet](#input\_tablet) | Enable/disable the USB tablet device | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of the VM | `string` | `null` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | The name of the Proxmox Node on which to place the VM | `string` | `null` | no |
| <a name="input_target_nodes"></a> [target\_nodes](#input\_target\_nodes) | A list of PVE node names on which to place the VM | `list(string)` | `null` | no |
| <a name="input_usb"></a> [usb](#input\_usb) | The usb block is used to configure USB devices | `list(any)` | `[]` | no |
| <a name="input_vga"></a> [vga](#input\_vga) | The vga block is used to configure the display device | `list(any)` | `[]` | no |
| <a name="input_vm_state"></a> [vm\_state](#input\_vm\_state) | The desired state of the VM, options are running, stopped and started | `string` | `"running"` | no |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | The ID of the VM in Proxmox | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_ipv4_address"></a> [default\_ipv4\_address](#output\_default\_ipv4\_address) | The default IPv4 address |
| <a name="output_default_ipv6_address"></a> [default\_ipv6\_address](#output\_default\_ipv6\_address) | The default IPv6 address |
| <a name="output_ssh_host"></a> [ssh\_host](#output\_ssh\_host) | The hostname or IP to use to connect to the VM for preprovisioning |
| <a name="output_ssh_port"></a> [ssh\_port](#output\_ssh\_port) | The port to connect to the VM over SSH for preprovisioning |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [Dennis Hoppe](https://gitlab.com/dhoppeIT).

## License

Apache 2 licensed. See [LICENSE](LICENSE) for full details.
