resource "proxmox_vm_qemu" "Unraid" {
  name               = "Unraid"
  target_node        = "pve1"
  description        = "Unraid VM provisioned by OpenTofu"
  memory             = 16384
  balloon            = 1000
  boot               = "order=usb0"
  tags               = "nas"
  start_at_node_boot = true
  cpu {
    cores   = 4
    sockets = 2
  }
  usb {
    id         = 0
    mapping_id = var.unraid_flash_mapping_id
  }
  pci {
    id         = "0"
    mapping_id = var.unraid_sata_mapping_id

  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  startup_shutdown {
    order            = null
    shutdown_timeout = null
    startup_delay    = null
  }
}
