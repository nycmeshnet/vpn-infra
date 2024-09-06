resource "ansible_group" "vpn_mgt" {
  name = "vpn_mgt"
  variables = {
    ansible_user                 = "root"
    ansible_ssh_private_key_file = "../terraform/vpn"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "meshworker" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.vpn_mgt.name]
  variables = {

  }
}
