output "routes_id" {
  description = "Map of id values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.id }
}
output "routes_address_prefix" {
  description = "Map of address_prefix values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.address_prefix }
}
output "routes_name" {
  description = "Map of name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.name }
}
output "routes_next_hop_in_ip_address" {
  description = "Map of next_hop_in_ip_address values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.next_hop_in_ip_address }
}
output "routes_next_hop_type" {
  description = "Map of next_hop_type values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.next_hop_type }
}
output "routes_resource_group_name" {
  description = "Map of resource_group_name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.resource_group_name }
}
output "routes_route_table_name" {
  description = "Map of route_table_name values across all routes, keyed the same as var.routes"
  value       = { for k, v in azurerm_route.routes : k => v.route_table_name }
}

