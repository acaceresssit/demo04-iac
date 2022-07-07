###########################
#Varibles de entratada de RG
##############################
variable "name" {
    type = string
    description = "RG"
  
}

variable "location" {
    type = string
    description = "Rgion de disponiblidad"
  
}

variable "resource_tags" {
    type = map(string)
    default = {}
  
}