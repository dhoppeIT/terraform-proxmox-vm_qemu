terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc7"
    }
  }

  required_version = ">= 1.0"
}
