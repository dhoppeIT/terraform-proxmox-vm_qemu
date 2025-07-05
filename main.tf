resource "proxmox_vm_qemu" "this" {
  name                        = var.name
  target_node                 = var.target_node
  target_nodes                = var.target_nodes
  vmid                        = var.vmid
  desc                        = var.desc
  define_connection_info      = var.define_connection_info
  bios                        = var.bios
  onboot                      = var.onboot
  startup                     = var.startup
  vm_state                    = var.vm_state
  protection                  = var.protection
  tablet                      = var.tablet
  bootdisk                    = var.bootdisk
  agent                       = var.agent
  pxe                         = var.pxe
  clone                       = var.clone
  clone_id                    = var.clone_id
  full_clone                  = var.full_clone
  hastate                     = var.hastate
  hagroup                     = var.hagroup
  qemu_os                     = var.qemu_os
  memory                      = var.memory
  balloon                     = var.balloon
  hotplug                     = var.hotplug
  scsihw                      = var.scsihw
  pool                        = var.pool
  tags                        = var.tags
  force_create                = var.force_create
  os_type                     = var.os_type
  force_recreate_on_change_of = var.force_recreate_on_change_of
  os_network_config           = var.os_network_config
  ssh_forward_ip              = var.ssh_forward_ip
  ssh_user                    = var.ssh_user
  ssh_private_key             = var.ssh_private_key
  ci_wait                     = var.ci_wait
  ciuser                      = var.ciuser
  cipassword                  = var.cipassword
  cicustom                    = var.cicustom
  ciupgrade                   = var.ciupgrade
  searchdomain                = var.searchdomain
  nameserver                  = var.nameserver
  sshkeys                     = var.sshkeys
  ipconfig0                   = var.ipconfig0
  ipconfig1                   = var.ipconfig1
  automatic_reboot            = var.automatic_reboot
  skip_ipv4                   = var.skip_ipv4
  skip_ipv6                   = var.skip_ipv6
  agent_timeout               = var.agent_timeout

  dynamic "cpu" {
    for_each = length(var.cpu) > 0 ? [var.cpu] : []

    content {
      affinity = lookup(cpu.value, "affinity", "")
      cores    = lookup(cpu.value, "cores", 1)
      limit    = lookup(cpu.value, "limit", 0)
      numa     = lookup(cpu.value, "numa", false)
      sockets  = lookup(cpu.value, "sockets", 1)
      type     = lookup(cpu.value, "type", "host")
      units    = lookup(cpu.value, "units", 0)
      vcores   = lookup(cpu.value, "vcores", 0)
    }
  }

  dynamic "vga" {
    for_each = length(var.vga) > 0 ? var.vga : []

    content {
      type   = lookup(vga.value, "type", "std")
      memory = lookup(vga.value, "memory", null)
    }
  }

  dynamic "network" {
    for_each = length(var.network) > 0 ? var.network : []

    content {
      id        = network.value.id
      model     = network.value.model
      macaddr   = lookup(network.value, "macaddr", null)
      bridge    = lookup(network.value, "bridge", "nat")
      tag       = lookup(network.value, "tag", 0)
      firewall  = lookup(network.value, "firewall", false)
      mtu       = lookup(network.value, "mtu", null)
      rate      = lookup(network.value, "rate", 0)
      queues    = lookup(network.value, "queues", 1)
      link_down = lookup(network.value, "link_down", false)
    }
  }

  dynamic "disk" {
    for_each = length(var.disk) > 0 ? var.disk : []

    content {
      asyncio              = lookup(disk.value, "asyncio", null)
      backup               = lookup(disk.value, "backup", true)
      cache                = lookup(disk.value, "cache", null)
      discard              = lookup(disk.value, "discard", false)
      disk_file            = lookup(disk.value, "disk_file", null)
      emulatessd           = lookup(disk.value, "emulatessd", false)
      format               = lookup(disk.value, "format", "raw")
      id                   = lookup(disk.value, "id", null)
      iops_r_burst         = lookup(disk.value, "iops_r_burst", 0)
      iops_r_burst_length  = lookup(disk.value, "iops_r_burst_length", 0)
      iops_r_concurrent    = lookup(disk.value, "iops_r_concurrent", 0)
      iops_wr_burst        = lookup(disk.value, "iops_wr_burst", 0)
      iops_wr_burst_length = lookup(disk.value, "iops_wr_burst_length", 0)
      iops_wr_concurrent   = lookup(disk.value, "iops_wr_concurrent", 0)
      iothread             = lookup(disk.value, "iothread", false)
      iso                  = lookup(disk.value, "iso", null)
      linked_disk_id       = lookup(disk.value, "linked_disk_id", null)
      mbps_r_burst         = lookup(disk.value, "mbps_r_burst", 0.0)
      mbps_r_concurrent    = lookup(disk.value, "mbps_r_concurrent", 0.0)
      mbps_wr_burst        = lookup(disk.value, "mbps_wr_burst", 0.0)
      mbps_wr_concurrent   = lookup(disk.value, "mbps_wr_concurrent", 0.0)
      passthrough          = lookup(disk.value, "passthrough", false)
      readonly             = lookup(disk.value, "readonly", false)
      replicate            = lookup(disk.value, "replicate", false)
      serial               = lookup(disk.value, "serial", null)
      size                 = lookup(disk.value, "size", null)
      slot                 = disk.value.slot
      storage              = lookup(disk.value, "storage", null)
      type                 = lookup(disk.value, "type", "disk")
      wwn                  = lookup(disk.value, "wwn", null)
    }
  }

  dynamic "efidisk" {
    for_each = length(var.efidisk) > 0 ? [var.efidisk] : []

    content {
      efitype = lookup(efidisk.value, "efitype", "4m")
      storage = efidisk.value.storage
    }
  }

  dynamic "pci" {
    for_each = length(var.pci) > 0 ? var.pci : []

    content {
      id            = pci.value.id
      mapping_id    = lookup(pci.value, "mapping_id", null)
      raw_id        = lookup(pci.value, "raw_id", null)
      pcie          = lookup(pci.value, "pcie", false)
      primary_gpu   = lookup(pci.value, "primary_gpu", false)
      rombar        = lookup(pci.value, "rombar", true)
      device_id     = lookup(pci.value, "device_id", null)
      vendor_id     = lookup(pci.value, "vendor_id", null)
      sub_device_id = lookup(pci.value, "sub_device_id", null)
      sub_vendor_id = lookup(pci.value, "sub_vendor_id", null)
      mdev          = lookup(pci.value, "mdev", null)
    }
  }

  dynamic "serial" {
    for_each = length(var.serial) > 0 ? var.serial : []

    content {
      id   = serial.value.id
      type = lookup(serial.value, "type", "socket")
    }
  }

  dynamic "usb" {
    for_each = length(var.usb) > 0 ? var.usb : []

    content {
      id         = usb.value.id
      device_id  = lookup(usb.value, "device_id", null)
      mapping_id = lookup(usb.value, "mapping_id", null)
      port_id    = lookup(usb.value, "port_id", null)
      usb3       = lookup(usb.value, "usb3", false)
    }
  }

  lifecycle {
    ignore_changes = [
      disk,
      sshkeys
    ]
  }
}
