output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(cloudstack_vpc.this.*.id, [""])[0]
}

output "vpc_source_nat_ip" {
  description = "The CIDR block of the VPC"
  value       = concat(cloudstack_vpc.this.*.source_nat_ip, [""])[0]
}

output "vpc_display_text" {
  description = "The CIDR block of the VPC"
  value       = concat(cloudstack_vpc.this.*.display_text, [""])[0]
}

output "network_id" {
  description = "The IDs of the networks in the VPC"
  value       = concat(cloudstack_network.private.*.id, [""])
}
