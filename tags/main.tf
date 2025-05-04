
# ------------------------------------------------------------------------------
# TAGS
# ------------------------------------------------------------------------------

locals {
  builtin_tags = {
    created-by  = "terraform-automation-platform"
    environment = var.environment
  }

  tags = merge(
    local.builtin_tags,
    var.tags
  )

  tags_as_list_of_maps = [
    for tag_name, tag_value in local.tags :
    merge(
      {
        key   = tag_name
        value = tag_value
      },
      var.additional_tag_map
    )
  ]
}
