output "storage_object_replications_id" {
  description = "Map of id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "storage_object_replications_destination_object_replication_id" {
  description = "Map of destination_object_replication_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.destination_object_replication_id if v.destination_object_replication_id != null && length(v.destination_object_replication_id) > 0 }
}
output "storage_object_replications_destination_storage_account_id" {
  description = "Map of destination_storage_account_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.destination_storage_account_id if v.destination_storage_account_id != null && length(v.destination_storage_account_id) > 0 }
}
output "storage_object_replications_metrics_enabled" {
  description = "Map of metrics_enabled values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.metrics_enabled if v.metrics_enabled != null }
}
output "storage_object_replications_rules" {
  description = "Map of rules values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.rules if v.rules != null && length(v.rules) > 0 }
}
output "storage_object_replications_source_object_replication_id" {
  description = "Map of source_object_replication_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.source_object_replication_id if v.source_object_replication_id != null && length(v.source_object_replication_id) > 0 }
}
output "storage_object_replications_source_storage_account_id" {
  description = "Map of source_storage_account_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.source_storage_account_id if v.source_storage_account_id != null && length(v.source_storage_account_id) > 0 }
}

