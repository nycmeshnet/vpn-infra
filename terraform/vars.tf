variable "proxmox_host" {
  type        = string
  description = "proxmox host"
}

variable "proxmox_token_id" {
  type        = string
  description = "proxmox token id"
  sensitive   = true
}

variable "proxmox_token_secret" {
  type        = string
  description = "proxmox token secret"
  sensitive   = true
}

variable "proxmox_node" {
  type        = string
  description = "name of the proxmox node"
}

variable "proxmox_storage_location" {
  type        = string
  description = "target resource pool on the proxmox server"
}

variable "hostname" {
  type        = string
  description = "hostname of the lxc"
}

variable "system_image" {
  type        = string
  description = "system image for the lxc"
  default     = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
}

variable "local_password" {
  type        = string
  description = "password for the local user"
  sensitive   = true
}

variable "vm_nic" {
  type        = string
  description = "nic for the vm"
  default     = "vmbr0"
}

variable "vm_mgt_ip" {
  type        = string
  description = "IP for the managment interface"
}

variable "vm_mgt_default_gateway" {
  type        = string
  description = "IP of the default gateway of the managment interface"
}
