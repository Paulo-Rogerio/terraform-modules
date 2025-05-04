output "tags" {
  description = "A map with all defined tags"
  value       = local.tags
}

output "tags_as_list_of_maps" {
  description = "A list of maps containing the defined tags"
  value       = local.tags_as_list_of_maps
}
