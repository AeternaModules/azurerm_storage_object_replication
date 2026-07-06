output "storage_object_replications" {
  description = "All storage_object_replication resources"
  value       = azurerm_storage_object_replication.storage_object_replications
}
output "storage_object_replications_destination_object_replication_id" {
  description = "List of destination_object_replication_id values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.destination_object_replication_id]
}
output "storage_object_replications_destination_storage_account_id" {
  description = "List of destination_storage_account_id values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.destination_storage_account_id]
}
output "storage_object_replications_metrics_enabled" {
  description = "List of metrics_enabled values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.metrics_enabled]
}
output "storage_object_replications_rules" {
  description = "List of rules values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.rules]
}
output "storage_object_replications_source_object_replication_id" {
  description = "List of source_object_replication_id values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.source_object_replication_id]
}
output "storage_object_replications_source_storage_account_id" {
  description = "List of source_storage_account_id values across all storage_object_replications"
  value       = [for k, v in azurerm_storage_object_replication.storage_object_replications : v.source_storage_account_id]
}

