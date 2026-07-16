output "routes_id" {
  description = "Map of id values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "routes_address_prefix" {
  description = "Map of address_prefix values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.address_prefix if v.address_prefix != null && length(v.address_prefix) > 0 }
}
output "routes_name" {
  description = "Map of name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "routes_next_hop_in_ip_address" {
  description = "Map of next_hop_in_ip_address values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.next_hop_in_ip_address if v.next_hop_in_ip_address != null && length(v.next_hop_in_ip_address) > 0 }
}
output "routes_next_hop_type" {
  description = "Map of next_hop_type values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.next_hop_type if v.next_hop_type != null && length(v.next_hop_type) > 0 }
}
output "routes_resource_group_name" {
  description = "Map of resource_group_name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "routes_route_table_name" {
  description = "Map of route_table_name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.route_table_name if v.route_table_name != null && length(v.route_table_name) > 0 }
}

