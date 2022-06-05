output "public_vm_internal_ip" {
  value       = yandex_compute_instance.netology-vm-public.network_interface.0.ip_address
}

output "public_vm_external_ip" {
  value       = yandex_compute_instance.netology-vm-public.network_interface.0.nat_ip_address
}


output "private_vm_internal_ip" {
  value       = yandex_compute_instance.netology-vm-private.network_interface.0.ip_address
}