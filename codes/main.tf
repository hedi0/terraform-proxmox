resource "proxmox_virtual_environment_vm" "hedi_vm" {
  name      = "hedi-tf-VM"
  node_name = "pve"

  # VM will be created but not started
  started = false

  # CPU configuration
  cpu {
    cores = 2
    type  = "qemu64"
  }

  # Memory configuration (in MB)
  memory {
    dedicated = 2048
  }

  # Disk configuration
  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "scsi0"
    size         = 3
  }

  # CD-ROM with ISO
  cdrom {
    file_id   = "local:iso/Core-16.2.iso"
    interface = "ide2"
  }

  # Network configuration
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

# Output VM information
output "vm_id" {
  description = "VM ID"
  value       = proxmox_virtual_environment_vm.hedi_vm.id
}

output "vm_name" {
  description = "VM Name"
  value       = proxmox_virtual_environment_vm.hedi_vm.name
}
