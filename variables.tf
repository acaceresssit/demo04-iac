variable "location" {
  default = "Central US"
}

variable "resource_group_name" {
  type = string
  default = "demo-iac-2022"

}
#//akz-<nombre-grupo>-<solucion-nombre>-<evn>-<version>
#//aks-iac-demo-dev-01 //  32 cares max, no palabras

variable "cluster_name" { 
  default = "aksdemo1"  

}

variable "agent_count" {
  default = 1


}

variable "dns_prefix" {
  default = "aksdemo"

}

variable "admin_username" {
  default = "aksdemo"

}

variable "output_directory" {
  default = "./output"

}

variable "kubeconfig_filename" {
  default = "aks-config"

}

variable "ssh_public_key" {
  type = string
  
}