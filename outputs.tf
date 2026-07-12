output "storage_object_replications_destination_object_replication_id" {
  description = "Map of destination_object_replication_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.destination_object_replication_id }
}
output "storage_object_replications_destination_storage_account_id" {
  description = "Map of destination_storage_account_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.destination_storage_account_id }
}
output "storage_object_replications_metrics_enabled" {
  description = "Map of metrics_enabled values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.metrics_enabled }
}
output "storage_object_replications_rules" {
  description = "Map of rules values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.rules }
}
output "storage_object_replications_source_object_replication_id" {
  description = "Map of source_object_replication_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.source_object_replication_id }
}
output "storage_object_replications_source_storage_account_id" {
  description = "Map of source_storage_account_id values across all storage_object_replications, keyed the same as var.storage_object_replications"
  value       = { for k, v in azurerm_storage_object_replication.storage_object_replications : k => v.source_storage_account_id }
}

