
variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}


variable "dns_prefix" {
  type = string
}

variable "agent_vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}
variable "admin_user" {
  type    = string
}

variable "agent_vm_count" {
  type    = string
}


variable "ssh_public_key" {
  type = string
}

variable "output_directory" {
  type    = string
  default = "./output"
}
