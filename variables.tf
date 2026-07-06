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
    metrics_enabled                = optional(bool) # Default: false
    rules = object({
      copy_blobs_created_after     = optional(string) # Default: "OnlyNewObjects"
      destination_container_name   = string
      filter_out_blobs_with_prefix = optional(set(string))
      source_container_name        = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.storage_object_replications : (
        v.rules.filter_out_blobs_with_prefix == null || (length(v.rules.filter_out_blobs_with_prefix) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_storage_object_replication's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: source_storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: source_storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: destination_storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: destination_storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: rules.source_container_name
  #   source:    [from validate.StorageContainerName] !regexp.MustCompile(`^\$root$|^\$web$|^[0-9a-z-]+$`).MatchString(value)
  # path: rules.source_container_name
  #   source:    [from validate.StorageContainerName] len(value) < 3 || len(value) > 63
  # path: rules.source_container_name
  #   source:    [from validate.StorageContainerName] regexp.MustCompile(`^-`).MatchString(value)
  # path: rules.destination_container_name
  #   source:    [from validate.StorageContainerName] !regexp.MustCompile(`^\$root$|^\$web$|^[0-9a-z-]+$`).MatchString(value)
  # path: rules.destination_container_name
  #   source:    [from validate.StorageContainerName] len(value) < 3 || len(value) > 63
  # path: rules.destination_container_name
  #   source:    [from validate.StorageContainerName] regexp.MustCompile(`^-`).MatchString(value)
  # path: rules.copy_blobs_created_after
  #   source:    [from validate.ObjectReplicationCopyBlobsCreatedAfter] !ok
  # path: rules.copy_blobs_created_after
  #   source:    [from validate.ObjectReplicationCopyBlobsCreatedAfter] err != nil
}

