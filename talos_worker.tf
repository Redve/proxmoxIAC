resource "proxmox_vm_qemu" "TalosWorker" {
  name               = "TalosWorker"
  vmid               = 210
  target_node        = "pve1"
  description        = "TalosOS Worker VM provisioned by OpenTofu"
  memory             = 8196
  start_at_node_boot = false
  tags               = "k8sworker"
  agent              = 1
  skip_ipv6          = true
  agent_timeout      = 5
  boot               = "order=virtio0;ide2"
  cpu {
    cores   = 3
    sockets = 2
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
