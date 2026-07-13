variable "storage_object_replications" {
  description = <<EOT
Map of storage_object_replications, attributes below
Required:
    - destination_storage_account_id
    - source_storage_account_id
    - rules (block):
        - copy_blobs_created_after (optional)
        - destination_container_name (required)
        - filter_out_blobs_with_prefix (optional)
        - source_container_name (required)
Optional:
    - metrics_enabled
EOT

  type = map(object({
    destination_storage_account_id = string
    source_storage_account_id      = string
    metrics_enabled                = optional(bool)
    rules = list(object({
      copy_blobs_created_after     = optional(string)
      destination_container_name   = string
      filter_out_blobs_with_prefix = optional(set(string))
      source_container_name        = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.storage_object_replications : (
        length(v.rules) >= 1
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_object_replications : (
        alltrue([for item in v.rules : (item.filter_out_blobs_with_prefix == null || (alltrue([for x in item.filter_out_blobs_with_prefix : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

