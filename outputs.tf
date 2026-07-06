output "routes" {
  description = "All route resources"
  value       = azurerm_route.routes
}
output "routes_address_prefix" {
  description = "List of address_prefix values across all routes"
  value       = [for k, v in azurerm_route.routes : v.address_prefix]
}
output "routes_name" {
  description = "List of name values across all routes"
  value       = [for k, v in azurerm_route.routes : v.name]
}
output "routes_next_hop_in_ip_address" {
  description = "List of next_hop_in_ip_address values across all routes"
  value       = [for k, v in azurerm_route.routes : v.next_hop_in_ip_address]
}
output "routes_next_hop_type" {
  description = "List of next_hop_type values across all routes"
  value       = [for k, v in azurerm_route.routes : v.next_hop_type]
}
output "routes_resource_group_name" {
  description = "List of resource_group_name values across all routes"
  value       = [for k, v in azurerm_route.routes : v.resource_group_name]
}
output "routes_route_table_name" {
  description = "List of route_table_name values across all routes"
  value       = [for k, v in azurerm_route.routes : v.route_table_name]
}

