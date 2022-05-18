resource "azurerm_public_ip" "pub" {
  name                = var.public_ip_name
  resource_group_name = azurerm_resource_group.rg1[0].name
  location            = var.location
  allocation_method   = var.allocation_method
  zones               = []
  ip_tags             = {}
  tags                = {}
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg1[0].name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = data.azurerm_subnet.mgmt.id
    private_ip_address_allocation = var.private_ip_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = azurerm_public_ip.pub.id
  }
  tags     = {}
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg1[0].name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.pub_ssh_key)
  }

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.img_version
  }
  tags     = {}
}