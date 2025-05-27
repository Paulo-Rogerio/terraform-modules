resource "cloudstack_vpc" "this" {
  name           = var.name
  cidr           = var.cidr
  vpc_offering   = var.vpc_offering
  zone           = var.zone
  #network_domain = var.network_domain
  #project        = var.project

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}

# Criando a rede isolada dentro da VPC
resource "cloudstack_network" "my_network" {
  name              = "my-network"
  cidr              = "10.1.1.0/24"
  network_offering  = var.vpc_offering
  zone              = var.zone
  vpc_id            = "98df7074-31d7-4621-9147-d8651946907c"
}