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
EOT

  type = map(object({
    destination_storage_account_id = string
    source_storage_account_id      = string
    rules = object({
      copy_blobs_created_after     = optional(string, "OnlyNewObjects")
      destination_container_name   = string
      filter_out_blobs_with_prefix = optional(set(string))
      source_container_name        = string
    })
  }))
}

