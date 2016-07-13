# Configure the OpenStack Provider
provider "openstack" {
    user_name  = "${var.user_name}"
    tenant_name = "${var.tenant_name}"
    password  = "${var.password}"
    auth_url  = "${var.auth_url}"
}

resource "openstack_compute_instance_v2" "basic" {
  name = "openstack-advanced-topics"
  image_id = "e45c00df-b189-414c-b82c-0917cd8a464d"
  flavor_id = "small"
  key_pair = "${var.key_pair_name}"
  security_groups = ["default"]

  network {
    name = "external"
  }

}


