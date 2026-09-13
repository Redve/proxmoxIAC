resource "proxmox_vm_qemu" "TalosWorker" {
  name               = "TalosWorker"
  vmid               = 210
  target_node        = "pve1"
  description        = "TalosOS Worker VM provisioned by OpenTofu"
  memory             = 4096
  start_at_node_boot = false
  tags               = "k8sworker"
  agent              = 1
  boot               = "order=virtio0;ide2"
  cpu {
    cores   = 4
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
          size    = "100G"
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
