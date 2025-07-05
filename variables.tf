variable "name" {
  type        = string
  description = "The name of the VM within Proxmox"
}

variable "target_node" {
  type        = string
  default     = null
  description = "The name of the Proxmox Node on which to place the VM"
}

variable "target_nodes" {
  type        = list(string)
  default     = null
  description = "A list of PVE node names on which to place the VM"
}

variable "vmid" {
  type        = number
  default     = 0
  description = "The ID of the VM in Proxmox"
}

variable "desc" {
  type        = string
  default     = null
  description = "The description of the VM"
}

variable "define_connection_info" {
  type        = bool
  default     = true
  description = "Whether to let terraform define the (SSH) connection parameters for preprovisioners"
}

variable "bios" {
  type        = string
  default     = "seabios"
  description = "The BIOS to use, options are seabios or ovmf for UEFI"
}

variable "onboot" {
  type        = bool
  default     = false
  description = "Whether to have the VM startup after the PVE node starts"
}

variable "startup" {
  type        = string
  default     = ""
  description = "The startup and shutdown behaviour"
}

variable "vm_state" {
  type        = string
  default     = "running"
  description = "The desired state of the VM, options are running, stopped and started"
}

variable "protection" {
  type        = bool
  default     = false
  description = "Enable/disable the VM protection from being removed"
}

variable "tablet" {
  type        = bool
  default     = true
  description = "Enable/disable the USB tablet device"
}

variable "bootdisk" {
  type        = string
  default     = null
  description = "Enable booting from specified disk"
}

variable "agent" {
  type        = number
  default     = 0
  description = "Set to 1 to enable the QEMU Guest Agent"
}

variable "pxe" {
  type        = bool
  default     = null
  description = "If set to true, enable PXE boot of the VM"
}

variable "clone" {
  type        = string
  default     = null
  description = "The base VM name from which to clone to create the new VM"
}

variable "clone_id" {
  type        = number
  default     = null
  description = "The base VM id from which to clone to create the new VM"
}

variable "full_clone" {
  type        = bool
  default     = true
  description = "Set to true to create a full clone, or false to create a linked clone"
}

variable "hastate" {
  type        = string
  default     = null
  description = "Requested HA state for the resource"
}

variable "hagroup" {
  type        = string
  default     = null
  description = "The HA group identifier the resource belongs to (requires hastate to be set!)"
}

variable "qemu_os" {
  type        = string
  default     = "l26"
  description = "The type of OS in the guest"
}

variable "memory" {
  type        = number
  default     = 0
  description = "The amount of memory to allocate to the VM in Megabytes"
}

variable "balloon" {
  type        = number
  default     = 0
  description = "The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired"
}

variable "sockets" {
  type        = number
  default     = 1
  description = "The number of CPU sockets to allocate to the VM"
}

variable "cores" {
  type        = number
  default     = 1
  description = "The number of CPU cores per CPU socket to allocate to the VM"
}

variable "vcpus" {
  type        = number
  default     = 0
  description = "The number of vCPUs plugged into the VM when it starts"
}

variable "cpu_type" {
  type        = string
  default     = "host"
  description = "The type of CPU to emulate in the Guest"
}

variable "numa" {
  type        = bool
  default     = false
  description = "Whether to enable Non-Uniform Memory Access in the guest"
}

variable "hotplug" {
  type        = string
  default     = "network,disk,usb"
  description = "Comma delimited list of hotplug features to enable"
}

variable "scsihw" {
  type        = string
  default     = "lsi"
  description = "The SCSI controller to emulate"
}

variable "pool" {
  type        = string
  default     = null
  description = "The resource pool to which the VM will be added"
}

variable "tags" {
  type        = string
  default     = null
  description = "Tags of the VM"
}

variable "force_create" {
  type        = bool
  default     = false
  description = "If false, and a VM of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings"
}

variable "os_type" {
  type        = string
  default     = null
  description = "Which provisioning method to use, based on the OS type"
}

variable "force_recreate_on_change_of" {
  type        = string
  default     = null
  description = "If the value of this string changes, the VM will be recreated"
}

variable "os_network_config" {
  type        = string
  default     = null
  description = "Network configuration to be copied into the VM when preprovisioning ubuntu or centos guests"
}

variable "ssh_forward_ip" {
  type        = string
  default     = null
  description = "The IP (and optional colon separated port), to use to connect to the host for preprovisioning"
}

variable "ssh_user" {
  type        = string
  default     = null
  description = "The user with which to connect to the guest for preprovisioning"
}

variable "ssh_private_key" {
  type        = string
  sensitive   = true
  default     = null
  description = "The private key to use when connecting to the guest for preprovisioning"
}

variable "ci_wait" {
  type        = number
  default     = 30
  description = "How to long in seconds to wait for before provisioning"
}

variable "ciuser" {
  type        = string
  default     = null
  description = "Override the default cloud-init user for provisioning"
}

variable "cipassword" {
  type        = string
  sensitive   = true
  default     = null
  description = "Override the default cloud-init user's password"
}

variable "cicustom" {
  type        = string
  default     = null
  description = "Instead specifying ciuser, cipasword, etc. you can specify the path to a custom cloud-init config file here"
}

variable "ciupgrade" {
  type        = bool
  default     = false
  description = "Whether to upgrade the packages on the guest during provisioning"
}

variable "searchdomain" {
  type        = string
  default     = null
  description = "Sets default DNS search domain suffix"
}

variable "nameserver" {
  type        = string
  default     = null
  description = "Sets default DNS server for guest"
}

variable "sshkeys" {
  type        = string
  default     = null
  description = "Newline delimited list of SSH public keys to add to authorized keys file for the cloud-init user"
}

variable "ipconfig0" {
  type        = string
  default     = ""
  description = "The first IP address to assign to the gues"
}

variable "ipconfig1" {
  type        = string
  default     = ""
  description = "The second IP address to assign to the guest"
}

variable "automatic_reboot" {
  type        = bool
  default     = true
  description = "Automatically reboot the VM when parameter changes require this"
}

variable "skip_ipv4" {
  type        = bool
  default     = null
  description = "Tells proxmox that acquiring an IPv4 address from the qemu guest agent isn't required, it will still return an ipv4 address if it could obtain one"
}

variable "skip_ipv6" {
  type        = bool
  default     = null
  description = "Tells proxmox that acquiring an IPv6 address from the qemu guest agent isn't required, it will still return an ipv6 address if it could obtain one"
}

variable "agent_timeout" {
  type        = number
  default     = 90
  description = "Timeout in seconds to keep trying to obtain an IP address from the guest agent one we have a connection"
}

variable "vga" {
  type        = list(any)
  default     = []
  description = "The vga block is used to configure the display device"
}

variable "network" {
  type        = list(any)
  default     = []
  description = "The network block is used to configure the network devices"
}

variable "disk" {
  type        = list(any)
  default     = []
  description = "The disk block is used to configure the disk devices"
}

variable "efidisk" {
  type        = map(any)
  default     = {}
  description = "The efidisk block is used to configure the disk used for EFI data storage"
}

variable "pci" {
  type        = list(any)
  default     = []
  description = "The pci block is used to configure PCI devices"
}

variable "serial" {
  type        = list(any)
  default     = []
  description = "The serial block is used to configure the serial devices"
}

variable "usb" {
  type        = list(any)
  default     = []
  description = "The usb block is used to configure USB devices"
}
