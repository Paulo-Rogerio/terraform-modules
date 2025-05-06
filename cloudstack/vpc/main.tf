resource "cloudstack_vpc" "this" {
  name           = var.name
  cidr           = var.cidr
  vpc_offering   = var.vpc_offering
  zone           = var.zone
  network_domain = var.network_domain
  project        = var.project

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}


