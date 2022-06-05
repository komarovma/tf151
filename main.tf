terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.zone_id
}

resource "yandex_vpc_network" "netology-network-tf" {
  name = "netology-tf"
}

resource "yandex_vpc_route_table" "netology-rt" {
  network_id = yandex_vpc_network.netology-network-tf.id
  name = "netology-rt"
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

resource "yandex_vpc_subnet" "public" {
  name = "netology-tf-public"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = var.zone_id
  network_id     = yandex_vpc_network.netology-network-tf.id
}

 resource "yandex_vpc_subnet" "private" {
   name = "netology-tf-private"
   v4_cidr_blocks = ["192.168.20.0/24"]
   zone           = var.zone_id
   network_id     = yandex_vpc_network.netology-network-tf.id
   route_table_id = yandex_vpc_route_table.netology-rt.id
 }
 

resource "yandex_compute_instance" "netology-nat" {
  name        = "netology-nat"
  platform_id = "standard-v1"
  zone        = var.zone_id

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"
    nat       = true
  }

  metadata = {
    ssh-keys = "myuser:${file(var.public_key_path)}"
  }
}


resource "yandex_compute_instance" "netology-vm-public" {
  name        = "netology-vm-public"
  platform_id = "standard-v1"
  zone        = var.zone_id

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys  = "myuser:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_instance" "netology-vm-private" {
  name        = "netology-vm-private"
  platform_id = "standard-v1"
  zone        = var.zone_id

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private.id
  }

  metadata = {
    ssh-keys  = "myuser:${file(var.public_key_path)}"
  }
}