resource "proxmox_vm_qemu" "TalosController" {
  name               = "TalosController"
  vmid               = 200
  target_node        = "pve1"
  description        = "TalosOS Controller VM provisioned by OpenTofu"
  memory             = 2048
  start_at_node_boot = false
  tags               = "k8scontroller"
  agent              = 1
  boot               = "order=virtio0;ide2"
  cpu {
    cores   = 2
    sockets = 1
  }
  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-nocloud-amd64.iso"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          storage = "local-lvm"
          size    = "20G"
          cache   = "writethrough"
        }
      }
    }
  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}
