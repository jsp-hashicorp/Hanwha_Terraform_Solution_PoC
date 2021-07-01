#### RG ####
variable hw_rg {
    type = string
    default = "hwsc-d-krc-cmms-rg"
}

variable cloo_rg {
    type = string
    default = "hwsc-t-krc-terraform-rg"
}

variable location {
    type = string
    default = "korea central"
}

#### APP GW ####
variable hw_appgw {
    type = string
    default = "hwsc-d-krc-agw-001"
}

variable hw_appgw_backend {
    type = string
    default = "/subscriptions/0043bf9b-ebf8-46ce-9c8e-685cebce15b1/resourceGroups/hwsc-d-krc-dt-rg/providers/Microsoft.Network/applicationGateways/hwsc-d-krc-agw-001/backendAddressPools/t-terraform-f-be-001"
}

