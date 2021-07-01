#### Virtual Machine ####

## NIC ##
resource "azurerm_network_interface" "cloo_vm_01_nic" {
  name                = format("%s-nic", var.cloo_vm_01)
  location            = var.location
  resource_group_name = var.cloo_rg

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.hw_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.cloo_vm_01_IP
  }
}

resource "azurerm_network_interface" "cloo_vm_02_nic" {
  name                = format("%s-nic", var.cloo_vm_02)
  location            = var.location
  resource_group_name = var.cloo_rg
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.hw_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.cloo_vm_02_IP
  }
}

## AVSET ##
resource "azurerm_availability_set" "cloo_avset" {
  name                         = var.cloo_avset
  location                     = var.location
  resource_group_name          = var.cloo_rg
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

## VM01 ##
resource "azurerm_linux_virtual_machine" "cloo_vm_01" {
  name                            = var.cloo_vm_01
  resource_group_name             = var.cloo_rg
  location                        = var.location
  size                            = var.cloo_vm_size
  admin_username                  = var.cloo_vm_admin_username
  admin_password                  = var.cloo_vm_admin_password
  disable_password_authentication = false
  availability_set_id             = azurerm_availability_set.cloo_avset.id
  network_interface_ids = [
    azurerm_network_interface.cloo_vm_01_nic.id
  ]
  
  os_disk {
    name                 = var.cloo_os_disk_01
    caching              = "ReadWrite"
    storage_account_type = var.cloo_os_storage
    disk_size_gb         = 30
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  custom_data = "${base64encode(file("script-vm1.sh"))}"
}

## VM02 ##
resource "azurerm_linux_virtual_machine" "cloo_vm_02" {
   name                            = var.cloo_vm_02
   resource_group_name             = var.cloo_rg
   location                        = var.location
   size                            = var.cloo_vm_size
   admin_username                  = var.cloo_vm_admin_username
   admin_password                  = var.cloo_vm_admin_password
   disable_password_authentication = false
   availability_set_id             = azurerm_availability_set.cloo_avset.id
   network_interface_ids = [
     azurerm_network_interface.cloo_vm_02_nic.id
   ]

   os_disk {
     name                 = var.cloo_os_disk_02
     caching              = "ReadWrite"
     storage_account_type = var.cloo_os_storage
     disk_size_gb         = 30
   }

   source_image_reference {
     publisher = "Canonical"
     offer     = "UbuntuServer"
     sku       = "18.04-LTS"
     version   = "latest"
   }

   custom_data = "${base64encode(file("script-vm2.sh"))}"
 }


## Snapshot backup ##
resource "azurerm_managed_disk" "snapshot" {
    name                  = var.cloo_os_disk_01
    location              = var.location
    resource_group_name   = var.cloo_rg
    storage_account_type  = "Standard_LRS"
    create_option         = "Copy"
    source_resource_id    = "/subscriptions/0043bf9b-ebf8-46ce-9c8e-685cebce15b1/resourceGroups/hwsc-t-krc-terraform-rg/providers/Microsoft.Compute/snapshots/hwsc-t-krc-terraform-f-web-vm-001_snapshot"
    disk_size_gb          = "30"
}

resource "azurerm_virtual_machine" "backup_vm_1" {
    name                  = var.cloo_vm_01
    location              = var.location
    resource_group_name   = var.cloo_rg
    network_interface_ids = [
      azurerm_network_interface.cloo_vm_01_nic.id
    ]

    vm_size               = var.cloo_vm_size

    storage_os_disk {
      name              = azurerm_managed_disk.snapshot.name
      os_type           = "Linux"
      managed_disk_id   = azurerm_managed_disk.snapshot.id
      create_option     = "Attach"
    }
}