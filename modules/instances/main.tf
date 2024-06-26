/*
locals {
  vm_user            = "debian"
  ssh_public_key  = "~/.ssh/otus.pub"
  ssh_private_key = "~/.ssh/otus"
}
*/
resource "yandex_compute_instance" "instances" {
  name        = var.vm_name
  hostname    = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone
  # folder_id   = var.folder_id
  resources {
    cores         = var.cpu
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.nat
    ip_address         = var.internal_ip_address
    nat_ip_address     = var.nat_ip_address
  }

  metadata = {
    user-data = "${file("~/Myhomework/otus_hw3_nginx/cloud-init.yaml")}"
  
  }
/*
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      host        = self.network_interface[0].nat_ip_address
      type        = "ssh"
      user        = local.user
      private_key = file(local.ssh_private_key)
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u '${local.user}' --private-key '${local.ssh_private_key}' --become -i '${self.network_interface[0].nat_ip_address},' provision.yml"
  }
*/
}
/*
resource "local_file" "inventory_file" {
  content = templatefile("./templates/inventory.tpl",
    {
      instances = yandex_compute_instance.instances
    }
  )
  filename = "./inventory.ini"
}
*/