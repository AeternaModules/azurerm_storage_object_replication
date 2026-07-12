resource "azurerm_storage_object_replication" "storage_object_replications" {
  for_each = var.storage_object_replications

  destination_storage_account_id = each.value.destination_storage_account_id
  source_storage_account_id      = each.value.source_storage_account_id
  metrics_enabled                = each.value.metrics_enabled

  dynamic "rules" {
    for_each = each.value.rules
    content {
      copy_blobs_created_after     = rules.value.copy_blobs_created_after
      destination_container_name   = rules.value.destination_container_name
      filter_out_blobs_with_prefix = rules.value.filter_out_blobs_with_prefix
      source_container_name        = rules.value.source_container_name
    }
  }
}

