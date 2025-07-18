terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc02"
    }
  }

  required_version = ">= 1.0"
}
