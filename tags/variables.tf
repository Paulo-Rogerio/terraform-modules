variable "tags" {
  description = "A key-value map containing the tags that will be assigned to resources"
  type        = map(string)

  validation {
    condition     = can(var.tags.service-name)
    error_message = "You must define a 'service-name' tag (case sensitive)."
  }

  validation {
    condition     = !can(var.tags.owner-layer-slug)
    error_message = "You must not define an 'owner-layer-slug' tag. This tag is retrieved automatically after the change is applied."
  }

  validation {
    condition     = !can(var.tags.cost-layer-slug) || length(try(var.tags.cost-layer-slug, "")) >= 3 && length(try(var.tags.cost-layer-slug, "")) <= 16
    error_message = "The 'cost-layer-slug' tag length must be between 3 and 16."
  }

  validation {
    condition     = !can(var.tags.operation-layer-slug) || length(try(var.tags.operation-layer-slug, "")) >= 3 && length(try(var.tags.operation-layer-slug, "")) <= 16
    error_message = "The 'operation-layer-slug' tag length must be between 3 and 16."
  }

  validation {
    condition = can([
      for value in values(var.tags) :
      regex("^[a-z][a-z0-9-]*[a-z0-9]$", value)
    ])
    error_message = "Tag values must start with a lower case letter and can only contain lower case letters, numbers and dashes (-)."
  }

  validation {
    # Regex: https://regex101.com/r/nRYRxd/1
    condition = can([
      for key in keys(var.tags) :
      regex("^(Name|Owner|Purpose|Cluster|[a-z][a-z0-9-]*[a-z0-9])$", key)
    ])
    error_message = "Tag keys must start with a lower case letter and can only contain lower case letters, numbers and dashes (-), except Name, Owner, Purpose, Cluster."
  }
}

variable "additional_tag_map" {
  description = "Additional tags for appending to each tag map"
  type        = map(string)
  default = {
    propagate_at_launch = true
  }
}

variable "environment" {
  description = "The environment name"
  type        = string

  validation {
    condition     = can(regex("^(sandbox|production|dr)$", var.environment))
    error_message = "The 'environment' tag must be 'sandbox', 'production' or 'dr'."
  }
}

