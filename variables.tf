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
  validation {
    condition = alltrue([
      for k, v in var.routes : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.routes : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.routes : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.routes : (
        length(v.address_prefix) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.routes : (
        v.next_hop_in_ip_address == null || (length(v.next_hop_in_ip_address) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

