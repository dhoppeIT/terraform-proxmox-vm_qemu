module "proxmox_vm_qemu" {
  source = "../../"

  name        = "debian-11"
  target_node = "pve01"

  clone   = "debian-11-template"
  os_type = "cloud-init"
  tags    = "debian,bullseye"
  vmid    = 8000

  # Hardware
  cores  = 2
  memory = 2048

  disk = [
    {
      slot    = "ide2"
      size    = "4M"
      storage = "local-lvm"
      type    = "cloudinit"
    },
    {
      slot    = "scsi0"
      size    = "20G"
      storage = "local-lvm"
    }
  ]

  network = [
    {
      id     = 0
      bridge = "vmbr0"
      model  = "virtio"
    }
  ]

  serial = [
    {
      id   = 0
      type = "socket"
    }
  ]

  # Cloud-Init
  ciuser       = "ansible"
  ciupgrade    = true
  ipconfig0    = "ip=10.0.30.200/24,gw=10.0.30.1"
  nameserver   = "10.0.30.2"
  searchdomain = "office.dhoppe.dev"
  sshkeys      = file("${path.module}/sshkeys.txt")

  # Options
  agent  = 1
  onboot = true
}
