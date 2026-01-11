resource "azurerm_storage_object_replication" "storage_object_replications" {
  for_each = var.storage_object_replications

  destination_storage_account_id = each.value.destination_storage_account_id
  source_storage_account_id      = each.value.source_storage_account_id

  rules {
    copy_blobs_created_after     = each.value.rules.copy_blobs_created_after
    destination_container_name   = each.value.rules.destination_container_name
    filter_out_blobs_with_prefix = each.value.rules.filter_out_blobs_with_prefix
    source_container_name        = each.value.rules.source_container_name
  }
}

