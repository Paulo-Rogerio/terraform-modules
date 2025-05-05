resource "cloudstack_vpc" "default" {
  name         = "test-vpc"
  cidr         = "10.0.0.0/16"
  vpc_offering = "Default VPC Offering"
  zone         = "zone-1"
}