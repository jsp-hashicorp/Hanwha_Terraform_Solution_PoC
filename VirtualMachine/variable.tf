#### RG ####
variable "hw_rg" {
  type    = string
  default = "hwsc-d-krc-dt-rg"
}

variable "cloo_rg" {
  type    = string
  default = "hwsc-t-krc-terraform-rg"
}

variable "location" {
  type    = string
  default = "koreacentral"
}


#### NETWORK ####
variable "hw_vnet" {
  type    = string
  default = "hwsc-d-krc-vnet-001"
}

variable "hw_subnet" {
  type    = string
  default = "d-a-snet-001"
}



#### VM ####
variable "cloo_vm_01_IP" {
  type    = string
  default = "10.151.5.9"
}

variable "cloo_vm_02_IP" {
  type    = string
  default = "10.151.5.10"
}

variable "cloo_avset" {
  type    = string
  default = "hwsc-t-krc-terraform-f-web-avail"
}

variable "cloo_vm_num" {
  type    = number
  default = 2
}

variable "cloo_vm_01" {
  type    = string
  default = "hwsc-t-krc-terraform-f-web-vm-001"
}

variable "cloo_vm_02" {
  type    = string
  default = "hwsc-t-krc-terraform-f-web-vm-002"
}

variable "cloo_vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "cloo_vm_admin_username" {
  type    = string
  default = "hanwha"
}

variable "cloo_vm_admin_password" {
  type    = string
  default = "qwer1234!@#$"
}

variable "cloo_os_storage" {
  type    = string
  default = "Standard_LRS"
}

variable "cloo_os_disk_01" {
  type    = string
  default = "hwsc-t-krc-terraform-f-web-disk-001"
}

variable "cloo_os_disk_02" {
  type    = string
  default = "hwsc-t-krc-terraform-f-web-disk-002"
}
