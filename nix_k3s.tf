resource "proxmox_vm_qemu" "nix_os" {
  name               = "nix-os"
  vmid               = 221
  target_node        = "pve1"
  description        = "Nix os provisioned by Opentofu"
  memory             = 8016
  start_at_node_boot = false
  tags               = "k3s"
  boot               = "order=virtio0;ide2"
  agent              = 1
  cpu {
    cores   = 4
    sockets = 2
  }
  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/latest-nixos-graphical-x86_64-linux.iso"
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
  startup_shutdown {
    order            = null
    shutdown_timeout = null
    startup_delay    = null
  }
}
