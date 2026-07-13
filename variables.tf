variable "routes" {
  description = <<EOT
Map of routes, attributes below
Required:
    - address_prefix
    - name
    - next_hop_type
    - resource_group_name
    - route_table_name
Optional:
    - next_hop_in_ip_address
EOT

  type = map(object({
    address_prefix         = string
    name                   = string
    next_hop_type          = string
    resource_group_name    = string
    route_table_name       = string
    next_hop_in_ip_address = optional(string)
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_route's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.RouteName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,78}[a-zA-Z0-9_]?$`).MatchString(value)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: route_table_name
  #   source:    [from validate.RouteTableName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,78}[a-zA-Z0-9_]?$`).MatchString(value)
  # path: address_prefix
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: next_hop_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: next_hop_in_ip_address
  #   condition: length(value) > 0
  #   message:   must not be empty
}

