resource "proxmox_lxc" "vpn_server" {
  target_node  = var.proxmox_node
  hostname     = var.hostname
  description  = "Wireguard VPN server managed from https://github.com/nycmesh/vpn-infra"
  ostemplate   = var.system_image
  password     = var.local_password
  cores        = 4
  unprivileged = true
  start        = true
  onboot       = true

  ssh_public_keys = file("${path.module}/vpn.pub")

  rootfs {
    storage = var.proxmox_storage_location
    size    = "4G"
  }

  network {
    name   = "eth0"
    bridge = var.vm_nic
    ip     = "${var.vm_mgt_ip}/${var.internal_host_identifier}"
    gw     = var.vm_mgt_default_gateway
  }

  tags = "vpn,managed_by_iac"
}
