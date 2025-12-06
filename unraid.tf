resource "proxmox_vm_qemu" "Unraid" {
  name               = "Unraid"
  target_node        = "pve1"
  description        = "Unraid VM provisioned by OpenTofu"
  memory             = 16384
  boot               = "order=usb0"
  start_at_node_boot = true
  cpu {
    cores   = 4
    sockets = 2
  }
  usb {
    id         = 0
    mapping_id = "unraid_flash"
  }
  pci {
    id         = "0"
    mapping_id = "sata_controller"

  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}
