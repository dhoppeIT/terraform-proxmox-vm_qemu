output "ssh_host" {
  description = "The hostname or IP to use to connect to the VM for preprovisioning"
  value       = module.proxmox_vm_qemu.ssh_host
}

output "ssh_port" {
  description = "The port to connect to the VM over SSH for preprovisioning"
  value       = module.proxmox_vm_qemu.ssh_port
}

output "default_ipv4_address" {
  description = "The default IPv4 address"
  value       = module.proxmox_vm_qemu.default_ipv4_address
}

output "default_ipv6_address" {
  description = "The default IPv6 address"
  value       = module.proxmox_vm_qemu.default_ipv6_address
}
