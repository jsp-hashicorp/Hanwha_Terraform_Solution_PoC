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
  description = "배포 지역 설정 한국 중부(koreacentral), 한국 남부(koreasouth)"
  
  validation {
    condition = contains(["koreacentral", "Korea Central", "koreasouth", "Korea South"], var.location)
    error_message = "Error : \n 지원되지 않는 배포 지역입니다. \n 다음 배포 지역(Region)만 사용 가능합니다. \n \t - 한국 중부 : koreacentral , Korea Central \n \t - 한국 남부 : koreasouth, Korea South \n ."
  }
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
   validation {
    condition = contains(["Standard_D4s_v3" , "Standard_D2s_v3" , "Standard_D3_v2", "Standard_D16s_v3", "Standard_E8s_v3", "Standard_F4s"], var.aks_vm_size)
    error_message = "Error : \n 지원되지 않는 VM Size입니다. \n 다음 VM Size만 사용 가능합니다. \n \t - Standard_D4s_v3 \n \t - Standard_D2s_v3 \n \t - Standard_D3_v2\n \t - Standard_D16s_v3\n \t - Standard_E8s_v3 \n \t - Standard_F4s \n ."
  }
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
