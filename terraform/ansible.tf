resource "ansible_group" "vpn_mgt" {
  name = "vpn_mgt"
  variables = {
    ansible_user                 = "root"
    ansible_ssh_private_key_file = "../terraform/vpn"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vpn_host" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.vpn_mgt.name]
  variables = {
    BIRD_ROUTER_ID           = var.vm_mgt_ip
    INTERNAL_HOST_IDENTIFIER = var.internal_host_identifier
    BIRD_NETWORKS            = var.bird_networks
    BIRD_NEIGHBORS           = var.bird_neighbors
    WG_PUBLIC_IP             = var.wg_public_ip
    PRIVATE_KEY              = var.wg_private_key
    PUBLIC_KEY               = var.wg_public_key
  }
}
