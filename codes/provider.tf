terraform {
  required_version = ">= 1.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}

variable "proxmox_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

provider "proxmox" {
  endpoint  = "https://PASTE_YOUR_VM_IP_HERE:8006/"
  api_token = "terraform@pve!terraform-token=${var.proxmox_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}